//
//  MapView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {

    @ObservedObject var mapPin: MapPin

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
//        let coordinate = CLLocationCoordinate2D(
//            latitude: 37.3351,
//            longitude: -122.0088)
//        let span = MKCoordinateSpan(
//            latitudeDelta: 2.0,
//            longitudeDelta: 2.0)
//        let region = MKCoordinateRegion(
//            center: coordinate,
//            span: span)
//        uiView.setRegion(region, animated: true)

        let point = MKPointAnnotation()
        point.coordinate = mapPin.coordinate
        point.title = mapPin.title
        point.subtitle = mapPin.subtitle
        uiView.addAnnotation(point)

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
                }
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
                mapView.locationManager.requestWhenInUseAuthorization()
                return
            case .authorizedWhenInUse:
                mapView.locationManager.pausesLocationUpdatesAutomatically = false
            case .authorizedAlways:
                mapView.locationManager.allowsBackgroundLocationUpdates = true
                mapView.locationManager.pausesLocationUpdatesAutomatically = false
            @unknown default:
                break
            }
            mapView.locationManager.startUpdatingLocation()
        }
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(mapPin: sampleMapPin)
    }
}
