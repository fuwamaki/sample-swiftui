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
    @ObservedObject(initialValue: SampleCViewModel()) var cviewModel: SampleCViewModel
    @ObservedObject(initialValue: SampleEViewModel()) var eviewModel: SampleEViewModel

    var body: some View {
        NavigationView {
            VStack {
                Text("Environment isEnable:" + "\(enabled)")
                    .padding(.all, 8)
                List {
                NavigationLink(
                    destination: SampleAView()
                        .environmentObject(SampleViewModel()),
                    label: {
                        Text("Sample A")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleBView(),
                    label: {
                        Text("Sample B")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleCView(),
                    label: {
                        Text("Sample C")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleDView(viewModel: cviewModel),
                    label: {
                        Text("Sample D")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleEView(viewModel: eviewModel),
                    label: {
                        Text("Sample E")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleFView(),
                    label: {
                        Text("Sample F")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleGView(),
                    label: {
                        Text("Sample G")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleHView(),
                    label: {
                        Text("Sample H")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleIView(),
                    label: {
                        Text("Sample I")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                NavigationLink(
                    destination: SampleJView(),
                    label: {
                        Text("Sample J")
                            .frame(height: 44)
                            .padding(.leading, 24)
                    })
                }
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
