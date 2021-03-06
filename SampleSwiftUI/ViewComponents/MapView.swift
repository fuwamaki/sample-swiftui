//
//  MapView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    @Binding var mode: MapSearchMode
    @ObservedObject var mapRoute: MapRoute
    @ObservedObject var currentLocation: MapPin = sampleMapPin

    var locationManager: CLLocationManager = CLLocationManager()

    func makeUIView(context: Context) -> MKMapView {
        let myMapView = MKMapView(frame: .zero)
        let tapGesture = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.addAnnotation(gesture:)))
        tapGesture.numberOfTapsRequired = 1
        myMapView.addGestureRecognizer(tapGesture)

        let doubleTapGesture = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.addAnnotation(gesture:)))
        doubleTapGesture.numberOfTapsRequired = 2
        myMapView.addGestureRecognizer(doubleTapGesture)
        tapGesture.require(toFail: doubleTapGesture)

        myMapView.delegate = context.coordinator
        locationManager.delegate = context.coordinator
        return myMapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        let span = MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
        switch mode {
        case .normal:
            if let location = locationManager.location?.coordinate {
                let region = MKCoordinateRegion(center: location, span: span)
                uiView.setRegion(region, animated: true)
            }
        case .guideStart:
            if let location = locationManager.location?.coordinate {
                let region = MKCoordinateRegion(center: location, span: span)
                uiView.setRegion(region, animated: true)
            }
            uiView.userTrackingMode = .follow
            DispatchQueue.main.async {
                self.mode = .guiding
            }
        case .log:
            context.coordinator.displayRecordCoordinates(view: uiView)
        default:
            break
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {

        var mapView: MapView
        var recordCoordinates: [CLLocationCoordinate2D] = []
        var startCoordinate: CLLocationCoordinate2D?
        var endCoordinate: CLLocationCoordinate2D?
        var totalTime: TimeInterval = 0.0
        var totalDistance: Double = 0.0

        init(_ mapView: MapView) {
            self.mapView = mapView
        }

        @objc func addAnnotation(gesture: UITapGestureRecognizer) {
            // シングルタップのみ判定
            guard gesture.numberOfTapsRequired == 1,
                  gesture.state == .ended,
                  let view = gesture.view as? MKMapView else { return }
            switch mapView.mode {
            case .normal, .route:
                if view.annotations.count > 0 {
                    view.removeAnnotations(view.annotations)
                }
                if view.overlays.count > 0 {
                    view.removeOverlays(view.overlays)
                }
                let point = gesture.location(in: view)
                let coordinate = view.convert(point, toCoordinateFrom: view)
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                view.addAnnotation(annotation)
                self.mapView.mode = .route
                displayRouteFromCurrent(view: view, destination: annotation)
            case .guiding:
                let point = gesture.location(in: view)
                let coordinate = view.convert(point, toCoordinateFrom: view)
                print("latitude: " + String(coordinate.latitude) + "  longitude: " + String(coordinate.longitude))
            default:
                break
            }
        }

        private func displayRouteFromCurrent(view: MKMapView, destination: MKPointAnnotation) {
            let directionsRequest = MKDirections.Request()
            directionsRequest.transportType = .automobile
            directionsRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: mapView.currentLocation.coordinate))
            directionsRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination.coordinate))
            let direction = MKDirections(request: directionsRequest)
            direction.calculate { [weak self] response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let route = response?.routes[0] {
                    view.addOverlay(route.polyline, level: .aboveRoads)
                    self?.mapView.mapRoute.time = route.expectedTravelTime
                    self?.mapView.mapRoute.advisoryNotices = route.advisoryNotices
                    self?.mapView.mapRoute.distance = route.distance
                    self?.mapView.mapRoute.name = route.name
                    let insets = UIEdgeInsets(top: 48, left: 48, bottom: 100, right: 48)
                    view.setVisibleMapRect(route.polyline.boundingMapRect,
                                           edgePadding: insets,
                                           animated: true)
                }
            }
            startCoordinate = mapView.currentLocation.coordinate
            endCoordinate = destination.coordinate
        }

        private func updateRoute(_ view: MKMapView) {
            guard let endCoordinate = endCoordinate else { return }
            let directionsRequest = MKDirections.Request()
            directionsRequest.transportType = .automobile
            directionsRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: mapView.currentLocation.coordinate))
            directionsRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: endCoordinate))
            let direction = MKDirections(request: directionsRequest)
            direction.calculate { [weak self] response, error in
                if let error = error {
                    print(error.localizedDescription)
                } else if let route = response?.routes[0] {
                    if view.overlays.count > 0 {
                        view.removeOverlays(view.overlays)
                    }
                    view.addOverlay(route.polyline, level: .aboveRoads)
                    self?.mapView.mapRoute.time = route.expectedTravelTime
                    self?.mapView.mapRoute.advisoryNotices = route.advisoryNotices
                    self?.mapView.mapRoute.distance = route.distance
                    self?.mapView.mapRoute.name = route.name
                }
            }
        }

        // これはLogging出力時に使うメソッド
        func displayRecordCoordinates(view: MKMapView) {
            guard let start = startCoordinate,
                  let end = endCoordinate else { return }
            totalTime = 0.0
            totalDistance = 0.0
            let directionsRequest = MKDirections.Request()
            let coordinates = [start] + recordCoordinates + [end]
            let placemarks: [MKMapItem] = coordinates.compactMap {
                MKMapItem(placemark: MKPlacemark(coordinate: $0)) }
            directionsRequest.transportType = .automobile
            if view.overlays.count > 0 {
                view.removeOverlays(view.overlays)
            }
            placemarks.enumerated().forEach {
                if $0 < placemarks.count-1 {
                    directionsRequest.source = $1
                    directionsRequest.destination = placemarks[$0+1]
                    let direction = MKDirections(request: directionsRequest)
                    direction.calculate { [weak self] response, error in
                        if let error = error {
                            print(error.localizedDescription)
                        } else if let route = response?.routes[0] {
                            view.addOverlay(route.polyline, level: .aboveRoads)
                            self?.totalTime += route.expectedTravelTime
                            self?.totalDistance = route.distance
//                            let insets = UIEdgeInsets(top: 48, left: 48, bottom: 100, right: 48)
//                            view.setVisibleMapRect(route.polyline.boundingMapRect,
//                                                   edgePadding: insets,
//                                                   animated: true)
                        }
                    }
                }
            }
        }

        // MARK: MKMapViewDelegate

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let route: MKPolyline = overlay as! MKPolyline
            let routeRenderer = MKPolylineRenderer(polyline: route)
            routeRenderer.strokeColor = UIColor(red:1.00, green:0.35, blue:0.30, alpha:1.0)
            routeRenderer.lineWidth = 3.0
            return routeRenderer
        }

        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            if self.mapView.mode == .guiding {
                updateRoute(mapView)
                mapView.userTrackingMode = .follow
            }
        }

        // MARK: CLLocationManagerDelegate

        // 位置情報が変わったら更新
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let coordinate = locations.first?.coordinate {
                mapView.currentLocation.coordinate.latitude = coordinate.latitude
                mapView.currentLocation.coordinate.longitude = coordinate.longitude
                let value = recordCoordinates
                    .filter {
                        $0.latitude == coordinate.latitude
                            && $0.longitude == coordinate.longitude }
                    .first
                if value == nil {
                    recordCoordinates.append(coordinate)
                }
            }
        }

        // TODO: 全パターンうまくいく構造ではないはずなので要テスト・要修正
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .restricted:
                break
            case .denied:
                return
            case .notDetermined:
                mapView.locationManager
                    .requestWhenInUseAuthorization()
                return
            case .authorizedWhenInUse:
                mapView.locationManager
                    .pausesLocationUpdatesAutomatically = false
            case .authorizedAlways:
                mapView.locationManager
                    .allowsBackgroundLocationUpdates = true
                mapView.locationManager
                    .pausesLocationUpdatesAutomatically = false
            @unknown default:
                break
            }
            mapView.locationManager.startUpdatingLocation()
        }
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mode: .constant(.normal), mapRoute: MapRoute(time: 60.0,
                                                             name: "渋谷",
                                                             distance: 22.0,
                                                             advisoryNotices: []))
    }
}
