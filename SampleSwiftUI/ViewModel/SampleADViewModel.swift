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
}


// MARK: PKCanvasViewDelegate
extension SampleADViewModel: PKCanvasViewDelegate {
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        print("canvasViewDidEndUsingTool")
    }
}
