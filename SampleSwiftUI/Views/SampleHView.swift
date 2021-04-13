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
                .padding(.bottom, 200)

            Image(systemName: "house")
                .resizable()
                .frame(width: 28, height: 24)
                .foregroundColor(.black)
                .font(.system(size: 32.0, weight: .bold))
        }
    }
}

struct SampleHView_Previews: PreviewProvider {
    static var previews: some View {
        SampleHView()
    }
}
