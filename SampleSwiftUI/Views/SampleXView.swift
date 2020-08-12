//
//  SampleXView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import SwiftUI
import MapKit
import CoreLocation

enum MapSearchMode {
    case normal
    case route
    case guideStart
    case guiding
}

// UIKitのMapを利用した場合
struct SampleXView: View {

    @State var mode: MapSearchMode = .normal
    @ObservedObject var mapRoute: MapRoute = MapRoute(time: 60.0,
                                                      name: "渋谷",
                                                      distance: 22.0,
                                                      advisoryNotices: [])

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                MapView(mode: $mode, mapRoute: mapRoute)
                    .edgesIgnoringSafeArea(.bottom)
                    .padding(.top, 0)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                if mode == .route {
                    VStack(alignment: .leading, content: {
                        HStack {
                            Image(systemName: "car")
                                .font(.system(size: 22))
                            Text(mapRoute.timeValue)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.salmon)
                            Text(mapRoute.distanceValue)
                                .font(.title3)
                                .foregroundColor(.textSecondary)
                            Spacer()
                            Button("出発") {
                                mode = .guideStart
                            }
                            .frame(width: 144, height: 40)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .font(.headline)
                            .cornerRadius(13.0)
                        }
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                        Text("目的地: " + mapRoute.name)
                            .padding(.leading, 24)
                            .font(.subheadline)
                            .foregroundColor(.textSecondary)
                    })
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, proxy.safeAreaInsets.bottom)
                    .background(Color.backgroundPrimary)
                }
            })
            .navigationTitle("Map")
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct SampleXView_Previews: PreviewProvider {
    static var previews: some View {
        SampleXView()
    }
}
