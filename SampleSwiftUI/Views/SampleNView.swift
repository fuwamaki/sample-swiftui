//
//  SampleNView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/20.
//

import SwiftUI

// CollectionViewっぽいサンプルコード LazyVGrid利用版
// LazyVGridを用いているので、処理が早い
struct SampleNView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
                ForEach((1...4004), id: \.self) { index in
                    Text("\(index)")
                        .frame(width: 60, height: 60)
                }
            }
        }
    }
}

struct SampleNView_Previews: PreviewProvider {
    static var previews: some View {
        SampleNView()
    }
}
