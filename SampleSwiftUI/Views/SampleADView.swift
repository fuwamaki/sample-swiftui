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
            Text("x: \(location.x)")
            Text("y: \(location.y)")
            Circle()
                .fill(Color.blue)
                .frame(width: 64, height: 64)
                .position(location)
                .gesture(
                    DragGesture().onChanged
                    { value in
                        location = value.location
                    }
                )
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
