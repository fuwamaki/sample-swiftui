//
//  SampleRView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/20.
//

import SwiftUI

// LazyVGridのサンプルコード
// header 固定バージョン
struct SampleRView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(), count: 4),
                pinnedViews: .sectionHeaders) {
                Section(header: Text("header")) {
                    ForEach((1...100), id: \.self) { index in
                        Text("\(index)")
                            .frame(width: 60, height: 60)
                    }
                }
            }
        }
    }
}

struct SampleRView_Previews: PreviewProvider {
    static var previews: some View {
        SampleRView()
    }
}
