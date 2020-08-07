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
            ScrollView {
                VStack {
                    Text("Environment isEnable:" + "\(enabled)")
                        .padding(.all, 8)
                    VStack {
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
                    VStack {
                        NavigationLink(
                            destination: SampleKView(),
                            label: {
                                Text("Sample K")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SampleLView(),
                            label: {
                                Text("Sample L")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SampleMView(),
                            label: {
                                Text("Sample M")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SampleNView(),
                            label: {
                                Text("Sample N")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SampleOView(),
                            label: {
                                Text("Sample O")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SamplePView(),
                            label: {
                                Text("Sample P")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SampleQView(),
                            label: {
                                Text("Sample Q")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SampleRView(),
                            label: {
                                Text("Sample R")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SampleSView(),
                            label: {
                                Text("Sample S")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                        NavigationLink(
                            destination: SampleTView(),
                            label: {
                                Text("Sample T")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                    }
                    VStack {
                        NavigationLink(
                            destination: SampleUView(),
                            label: {
                                Text("Sample U")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                    }
                    VStack {
                        NavigationLink(
                            destination: SampleVView(),
                            label: {
                                Text("Sample V")
                                    .frame(height: 44)
                                    .padding(.leading, 24)
                            })
                    }
                    VStack {
                        NavigationLink(
                            destination: SampleWView(),
                            label: {
                                Text("Sample W")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
