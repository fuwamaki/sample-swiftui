//
//  SampleMView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/19.
//

import SwiftUI

// CollectionViewっぽいサンプルコード
// すべて表示時に描画するので、表示に時間がかかる
struct SampleMView: View {

    var body: some View {
        ScrollView {
            ForEach((0...1000), id: \.self) { row in
                HStack {
                    ForEach((1...4), id: \.self) { column in
                        Text("\(row*4+column)")
                            .frame(width: 80, height: 60) // widthは目視で同じになるように任意の値を設定
                    }
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct SampleMView_Previews: PreviewProvider {
    static var previews: some View {
        SampleMView()
    }
}
