//
//  SampleAAView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/11/19.
//

import SwiftUI

struct SampleAAView: View {
    @State var showHeart: Bool = false

    var body: some View {
        TabView {
            self.contents
            self.contents
        }
        .tabViewStyle(PageTabViewStyle())
    }

    var contents: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(1..<1000, id: \.self) { _ in
                    Text("HELLO WORLD HELLOWORLD")
                    Divider()
                }
            }
        }
    }
}

struct SampleAAView_Previews: PreviewProvider {
    static var previews: some View {
        SampleAAView()
    }
}
