//
//  SampleHView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/19.
//

import SwiftUI

// LabelとLinkのサンプルコード
struct SampleHView: View {
    var body: some View {
        VStack {
            Label("Lightning", systemImage: "bolt.fill")
            Link("View Our Terms of Service",
                 destination: URL(string: "https://google.com")!)
        }
    }
}

struct SampleHView_Previews: PreviewProvider {
    static var previews: some View {
        SampleHView()
    }
}
