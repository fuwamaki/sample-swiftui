//
//  ContentView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/15.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.isEnabled) var enabled: Bool

    @State private var isShowSetting: Bool = false

    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: SampleAView(),
                    label: {
                        Text("Sample1")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleAView(),
                    label: {
                        Text("Sample2")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
            }
            .navigationTitle("SampleSwiftUI")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        self.isShowSetting.toggle()
                    }, label: {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24, weight: .light))
                    })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
