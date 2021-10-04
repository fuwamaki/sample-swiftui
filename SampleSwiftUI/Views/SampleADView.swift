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
        ZStack {
            CanvasView(canvasView: $canvasView, viewModel: viewModel)
                .allowsHitTesting(!viewModel.isCheckPointMode)
            if viewModel.isCheckPointMode {
                VStack {
                    ZStack {
                        if viewModel.circleCount > 0 {
                            CustomCircle(location: $viewModel.circleLocation1)
                        }
                        if viewModel.circleCount > 1 {
                            CustomCircle(location: $viewModel.circleLocation2)
                        }
                        if viewModel.circleCount > 2 {
                            CustomCircle(location: $viewModel.circleLocation3)
                        }
                        if viewModel.circleCount > 3 {
                            CustomCircle(location: $viewModel.circleLocation4)
                        }
                        if viewModel.circleCount > 4 {
                            CustomCircle(location: $viewModel.circleLocation5)
                        }
                        if viewModel.circleCount > 5 {
                            CustomCircle(location: $viewModel.circleLocation6)
                        }
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            viewModel.addCircle()
                        }, label: {
                            Text("円1つ追加")
                        })
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8.0)
                        Button(action: {
                            viewModel.removeCircle()
                        }, label: {
                            Text("円1つ削除")
                        })
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8.0)
                        Button(action: {
                            canvasView.drawing = PKDrawing()
                            viewModel.reset()
                        }, label: {
                            Text("リセット")
                        })
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8.0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct SampleADView_Previews: PreviewProvider {
    static var previews: some View {
        SampleADView()
    }
}
