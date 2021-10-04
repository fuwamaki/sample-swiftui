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
                Circle()
                    .fill(Color.blue)
                    .frame(width: 64, height: 64)
                    .position(viewModel.circleLocation1)
                    .gesture(
                        DragGesture().onChanged
                        { value in
                            viewModel.circleLocation1 = value.location
                        }
                    )
                Circle()
                    .fill(Color.blue)
                    .frame(width: 64, height: 64)
                    .position(viewModel.circleLocation2)
                    .gesture(
                        DragGesture().onChanged
                        { value in
                            viewModel.circleLocation2 = value.location
                        }
                    )
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
