//
//  SamplePView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/20.
//

import SwiftUI

// LazyVGridのサンプルコード: flexible
// flexible...グリッドのサイズを最小値〜最大値で設定
struct SamplePView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.flexible(minimum: 30, maximum: 100)),
                          GridItem(.flexible(minimum: 0, maximum: 10))]) {
                ForEach((1...100), id: \.self) { index in
                    Text("\(index)")
                }
            }
        }
    }
}

struct SamplePView_Previews: PreviewProvider {
    static var previews: some View {
        SamplePView()
    }
}
