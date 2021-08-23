//
//  SampleACView.swift
//  SampleACView
//
//  Created by yusaku maki on 2021/08/23.
//

import SwiftUI

struct SampleACView: View {

    func gradientView(start: Color, end: Color) -> LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: [start, end]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }

    var body: some View {
        VStack(spacing: 16.0) {
            Button {
                print("click")
            } label: {
                Text("Button")
                    .frame(width: 200.0, height: 40.0)
                    .foregroundColor(.white)
                    .background(gradientView(start: Color.blue,
                                             end: Color.blue.opacity(0.5)))
                    .cornerRadius(20)
            }
        }
    }
}

struct SampleACView_Previews: PreviewProvider {
    static var previews: some View {
        SampleACView()
    }
}
