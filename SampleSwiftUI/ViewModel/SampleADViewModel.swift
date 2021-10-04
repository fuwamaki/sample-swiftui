//
//  SampleADViewModel.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2021/10/04.
//

import Foundation
import PencilKit

class SampleADViewModel: NSObject, ObservableObject {

    @Published var isPencilMode: Bool = false
    @Published var circleLocation1 = CGPoint(x: 40, y: 40)
    @Published var circleLocation2 = CGPoint(x: 40, y: 120)
}


// MARK: PKCanvasViewDelegate
extension SampleADViewModel: PKCanvasViewDelegate {
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        print("canvasViewDidEndUsingTool")
    }
}
