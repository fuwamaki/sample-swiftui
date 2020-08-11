//
//  MapRoute.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/11.
//

import Foundation

class MapRoute: ObservableObject {
    @Published var time: TimeInterval
    @Published var name: String
    @Published var distance: Double
    @Published var advisoryNotices: [String]

    init(time: TimeInterval,
         name: String,
         distance: Double,
         advisoryNotices: [String]) {
        self.time = time
        self.name = name
        self.distance = distance
        self.advisoryNotices = advisoryNotices
    }

    var timeValue: String {
        switch Int(time) {
        case let value where value < 60:
            return String(value) + "秒"
        case let value where 60 <= value && value < 3600:
            return String(Int(value / 60)) + "分"
        case let value where 3600 <= value && value % 3600 == 0:
            return String(Int(value / 3600)) + "時間"
        case let value where 3600 <= value && value % 3600 != 0:
            return String(Int(value / 3600)) + "時間 " + String(Int((value % 3600) / 60)) + "分"
        default:
            return String(Int(time)) + "秒"
        }
    }

    var distanceValue: String {
        switch distance {
        case let value where distance < 1000:
            return "(" + String(Int(value)) + "m" + ")"
        default:
            return "(" + String(distance / 1000) + "km" + ")"
        }
    }
}
