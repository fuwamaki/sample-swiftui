//
//  CanvasView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2021/10/04.
//

import SwiftUI
import UIKit
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: CustomCanvasView
    @ObservedObject var viewModel: SampleADViewModel

    func makeUIView(context: Context) -> CustomCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.delegate = viewModel
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 5)
        return canvasView
    }

    func updateUIView(_ canvasView: CustomCanvasView, context: Context) {
        canvasView.isUserInteractionEnabled = !viewModel.isCheckPointMode
        if canvasView.velocityList.count > 0 {
            viewModel.velocityList = canvasView.velocityList
            canvasView.velocityList = []
        }
    }
}

final class CustomCanvasView: PKCanvasView {
    public var velocityList: [CGFloat] = []
    private var prevEventTime: TimeInterval?

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let aTouch: UITouch = touches.first!
        let location = aTouch.location(in: self)
        let prevLocation = aTouch.previousLocation(in: self)
        if let eventTime = event?.timestamp, let prev = prevEventTime {
            let time = CGFloat(eventTime - prev)
            let distance = sqrt(pow((location.x-prevLocation.x), 2)
                                    + pow((location.y-prevLocation.y), 2))
            velocityList.append(distance/time)
            print("velocity: \(distance/time)")
        }
        prevEventTime = event?.timestamp
    }
}
