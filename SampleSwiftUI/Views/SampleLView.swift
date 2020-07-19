//
//  SampleLView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/19.
//

import SwiftUI

// ProgressViewのサンプルコード
struct SampleLView: View {

    @State private var progress = 0.5

    var body: some View {
        VStack {
            ProgressView(value: 0.25)
            Spacer()
        }
        .progressViewStyle(DarkBlueShadowProgressViewStyle())
    }
}

struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6),
                    radius: 4.0, x: 1.0, y: 2.0)
    }
}

struct SampleLView_Previews: PreviewProvider {
    static var previews: some View {
        SampleLView()
    }
}
