//
//  MapView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

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
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, span: span)
            uiView.setRegion(region, animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {

        var mapView: MapView

        init(_ mapView: MapView) {
            self.mapView = mapView
        }

        @objc func addAnnotation(gesture: UITapGestureRecognizer) {
            // シングルタップのみ判定
            guard gesture.numberOfTapsRequired == 1 else { return }
            if gesture.state == .ended {
                if let mapView = gesture.view as? MKMapView {
                    let point = gesture.location(in: mapView)
                    let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = coordinate
                    mapView.addAnnotation(annotation)
                    addRoute(view: mapView, tapAnnotation: annotation)
                }
            }
        }

        private func addRoute(view: MKMapView, tapAnnotation: MKPointAnnotation) {
            let directionsRequest = MKDirections.Request()
            let coordinates: [CLLocationCoordinate2D] = [
                mapView.currentLocation.coordinate,
                tapAnnotation.coordinate]
            let placemarks: [MKMapItem] = coordinates.compactMap {
                return MKMapItem(placemark: MKPlacemark(coordinate: $0)) }
            directionsRequest.transportType = .automobile
            placemarks.enumerated().forEach {
                if $0 < placemarks.count-1 {
                    directionsRequest.source = $1
                    directionsRequest.destination = placemarks[$0+1]
                    let direction = MKDirections(request: directionsRequest)
                    direction.calculate { [weak self] response, error in
                        if let error = error {
                            print(error.localizedDescription)
                        } else if let polyline = response?.routes[0].polyline {
                            view.addOverlay(polyline, level: .aboveRoads)
                            if let route = response?.routes[0] {
                                self?.mapView.mapRoute.time = route.expectedTravelTime
                                self?.mapView.mapRoute.advisoryNotices = route.advisoryNotices
                                self?.mapView.mapRoute.distance = route.distance
                                self?.mapView.mapRoute.name = route.name
                            }
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

        // MARK: CLLocationManagerDelegate

        // 位置情報が変わったら更新
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let latitude = locations.first?.coordinate.latitude,
               let longitude = locations.first?.coordinate.longitude {
                mapView.currentLocation.coordinate.latitude = latitude
                mapView.currentLocation.coordinate.longitude = longitude
            }
        }

        // TODO: 全パターンうまくいく構造ではないはずなので要テスト・要修正
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus() {
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
        MapView(mapRoute: MapRoute(time: 60.0,
                                   name: "渋谷",
                                   distance: 22.0,
                                   advisoryNotices: []))
    }
}
