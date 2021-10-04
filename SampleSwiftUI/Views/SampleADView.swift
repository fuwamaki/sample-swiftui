//
//  SampleADView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2021/10/04.
//

import SwiftUI
import PencilKit

struct SampleADView: View {
    @State private var canvasView = CustomCanvasView()
    @ObservedObject private var viewModel = SampleADViewModel()

    @State private var location: CGPoint = CGPoint(x: 0, y: 0)

    var body: some View {
        VStack {
            ZStack {
                CustomCircle(location: $viewModel.circleLocation1)
                CustomCircle(location: $viewModel.circleLocation2)
                CustomCircle(location: $viewModel.circleLocation3)
                CustomCircle(location: $viewModel.circleLocation4)
                CustomCircle(location: $viewModel.circleLocation5)
                CustomCircle(location: $viewModel.circleLocation6)
            }
        }
//        VStack {
//            CanvasView(canvasView: $canvasView, viewModel: viewModel)
//            Button(action: {
//                canvasView.drawing = PKDrawing()
//            }, label: {
//                Text("Clear")
//            })
//        }
    }
}

struct SampleADView_Previews: PreviewProvider {
    static var previews: some View {
        SampleADView()
    }
}
