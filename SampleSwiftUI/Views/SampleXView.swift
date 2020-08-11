//
//  SampleXView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import SwiftUI
import MapKit
import CoreLocation

// UIKitのMapを利用した場合
struct SampleXView: View {

    var body: some View {
        ZStack {
            MapView(mapPin: sampleMapPin)
                .edgesIgnoringSafeArea(.bottom)
                .padding(.top, 0)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity)
        }
        .navigationTitle("Map")
    }
}

struct SampleXView_Previews: PreviewProvider {
    static var previews: some View {
        SampleXView()
    }
}

final class LocationManagerDelegate: NSObject, CLLocationManagerDelegate {

    @ObservedObject var currentLocation: MapPin

    init(currentLocation: ObservedObject<MapPin>) {
        self._currentLocation = currentLocation
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let latitude = locations.first?.coordinate.latitude,
           let longitude = locations.first?.coordinate.longitude {
            currentLocation.coordinate.latitude = latitude
            currentLocation.coordinate.longitude = longitude
        }
    }
}
