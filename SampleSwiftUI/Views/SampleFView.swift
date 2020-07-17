//
//  SampleFView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

struct SampleFView: View {

    // memo: AppStorageはArrayに対応していない
    @AppStorage("username")
    var username: String = "Anonymous"

    var body: some View {
        VStack {
            Text("Welcome, \(username)!")
                .frame(height: 40)
            Button("Log in") {
                self.username = "@twostraws"
            }
            .frame(height: 40)
            Button("Reset") {
                self.username = "Anonymous"
            }
            .frame(height: 40)
        }
    }
}

struct SampleFView_Previews: PreviewProvider {
    static var previews: some View {
        SampleFView()
    }
}
