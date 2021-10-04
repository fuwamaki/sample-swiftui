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

    var body: some View {
        VStack {
            CanvasView(canvasView: $canvasView, viewModel: viewModel)
            Button(action: {
                canvasView.drawing = PKDrawing()
            }, label: {
                Text("Clear")
            })
        }
    }
}

struct SampleADView_Previews: PreviewProvider {
    static var previews: some View {
        SampleADView()
    }
}
