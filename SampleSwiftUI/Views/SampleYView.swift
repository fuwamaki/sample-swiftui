//
//  SampleYView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import SwiftUI
import MapKit

struct SampleYView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.655164046,
            longitude: 139.740663704),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1))

    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SampleYView_Previews: PreviewProvider {
    static var previews: some View {
        SampleYView()
    }
}
