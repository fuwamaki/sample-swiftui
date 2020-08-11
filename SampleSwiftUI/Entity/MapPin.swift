//
//  MapPin.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import MapKit

class MapPin: ObservableObject {
    @Published var coordinate: CLLocationCoordinate2D
    @Published var title: String?
    @Published var subtitle: String?

    init(coordinate: CLLocationCoordinate2D,
         title: String? = nil,
         subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

var sampleMapPin: MapPin = MapPin(coordinate: CLLocationCoordinate2D(
                                    latitude: 37.0,
                                    longitude: -122.0),
                                  title: "Title",
                                  subtitle: "subTitle")
