//
//  SampleSView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/23.
//

import SwiftUI

// DisclosureGroupのサンプルコード
struct SampleSView: View {

    @State var isShowGroupList: Bool = true

    var body: some View {
        DisclosureGroup("池袋", isExpanded: $isShowGroupList) {
            Text("東池袋")
                .frame(height: 44, alignment: .leading)
            Text("西池袋")
                .frame(height: 44, alignment: .leading)
            Text("南池袋")
                .frame(height: 44, alignment: .leading)
            Text("北池袋")
                .frame(height: 44, alignment: .leading)
        }

    }
}

struct SampleSView_Previews: PreviewProvider {
    static var previews: some View {
        SampleSView()
    }
}
