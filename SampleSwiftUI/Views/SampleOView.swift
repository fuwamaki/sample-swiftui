//
//  SampleOView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/20.
//

import SwiftUI

// LazyVGridのサンプルコード: fixed
// fixed...グリッドのサイズを固定で設定
struct SampleOView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [GridItem(.fixed(10)),
                          GridItem(.fixed(30)),
                          GridItem(.fixed(20))]) {
                ForEach((1...100), id: \.self) { index in
                    Text("\(index)")
                }
            }
        }
    }
}

struct SampleOView_Previews: PreviewProvider {
    static var previews: some View {
        SampleOView()
    }
}
