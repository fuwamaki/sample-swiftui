//
//  SampleADViewModel.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2021/10/04.
//

import Foundation
import PencilKit

class SampleADViewModel: NSObject, ObservableObject {

    @Published var isCheckPointMode: Bool = false
    @Published var circleCount: Int = 1
    @Published var velocityList: [CGFloat] = []

    @Published var circleLocation1 = CGPoint(x: 40, y: 40)
    @Published var circleLocation2 = CGPoint(x: 40, y: 120)
    @Published var circleLocation3 = CGPoint(x: 40, y: 200)
    @Published var circleLocation4 = CGPoint(x: 40, y: 280)
    @Published var circleLocation5 = CGPoint(x: 40, y: 360)
    @Published var circleLocation6 = CGPoint(x: 40, y: 440)

    func reset() {
        isCheckPointMode = false
        circleCount = 1
        circleLocation1 = CGPoint(x: 40, y: 40)
        circleLocation2 = CGPoint(x: 40, y: 120)
        circleLocation3 = CGPoint(x: 40, y: 200)
        circleLocation4 = CGPoint(x: 40, y: 280)
        circleLocation5 = CGPoint(x: 40, y: 360)
        circleLocation6 = CGPoint(x: 40, y: 440)
    }

    func addCircle() {
        circleCount += 1
        print(velocityList)
    }

    func removeCircle() {
        circleCount -= 1
    }
}


// MARK: PKCanvasViewDelegate
extension SampleADViewModel: PKCanvasViewDelegate {
    // ペン書きを終えたタイミング（=一筆書き後）ではしる処理
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        isCheckPointMode.toggle()
    }
}
