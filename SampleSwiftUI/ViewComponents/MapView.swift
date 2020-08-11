//
//  MapView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var mapPin: MapPin

    func makeUIView(context: Context) -> MKMapView {
            MKMapView(frame: .zero)
        }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 37.3351,
            longitude: -122.0088)
        let span = MKCoordinateSpan(
            latitudeDelta: 2.0,
            longitudeDelta: 2.0)
        let region = MKCoordinateRegion(
            center: coordinate,
            span: span)
        uiView.setRegion(region, animated: true)

        let point = MKPointAnnotation()
        point.coordinate = mapPin.coordinate
        point.title = mapPin.title
        point.subtitle = mapPin.subtitle
        uiView.addAnnotation(point)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            mapPin: .constant(MapPin(coordinate: CLLocationCoordinate2D(
                                        latitude: 37.0,
                                        longitude: -122.0),
                                     title: "Title",
                                     subtitle: "subTitle")))
    }
}
