//
//  SampleQView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/20.
//

import SwiftUI

// LazyVGridのサンプルコード: adaptive
// adaptive...グリッドのサイズを最小値〜最大値で設定し、アイテムを詰めて設置
struct SampleQView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
                ForEach((1...100), id: \.self) { index in
                    Text("\(index)")
                }
            }
        }
    }
}

struct SampleQView_Previews: PreviewProvider {
    static var previews: some View {
        SampleQView()
    }
}
