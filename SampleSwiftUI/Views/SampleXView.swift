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
            MapView()
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
