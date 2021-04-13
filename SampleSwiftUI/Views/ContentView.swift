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
                    VStack {
                        Text("Environment isEnable:" + "\(enabled)")
                            .padding(.all, 8)
                        Divider()
                    }
                    VStack {
                        NavigationLink(
                            destination: SampleAView()
                                .environmentObject(SampleViewModel()),
                            label: {
                                Text("Sample A")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleBView(),
                            label: {
                                Text("Sample B")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleCView(),
                            label: {
                                Text("Sample C")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleDView(viewModel: cviewModel),
                            label: {
                                Text("Sample D")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleEView(viewModel: eviewModel),
                            label: {
                                Text("Sample E")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                    }
                    VStack {
                        NavigationLink(
                            destination: SampleFView(),
                            label: {
                                Text("Sample F")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleGView(),
                            label: {
                                Text("Sample G")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleHView(),
                            label: {
                                Text("Sample H")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleIView(),
                            label: {
                                Text("Sample I")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleJView(),
                            label: {
                                Text("Sample J")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                    }
                    VStack {
                        NavigationLink(
                            destination: SampleKView(),
                            label: {
                                Text("Sample K")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleLView(),
                            label: {
                                Text("Sample L")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleMView(),
                            label: {
                                Text("Sample M")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleNView(),
                            label: {
                                Text("Sample N")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleOView(),
                            label: {
                                Text("Sample O")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                    }
                    VStack {
                        NavigationLink(
                            destination: SamplePView(),
                            label: {
                                Text("Sample P")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleQView(),
                            label: {
                                Text("Sample Q")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleRView(),
                            label: {
                                Text("Sample R")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleSView(),
                            label: {
                                Text("Sample S")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleTView(),
                            label: {
                                Text("Sample T")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                    }
                    VStack {
                        NavigationLink(
                            destination: SampleUView(),
                            label: {
                                Text("Sample U")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleVView(),
                            label: {
                                Text("Sample V")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleWView(),
                            label: {
                                Text("Sample W")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleXView(),
                            label: {
                                Text("Sample X")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleYView(),
                            label: {
                                Text("Sample Y")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                    }
                    VStack {
                        NavigationLink(
                            destination: SampleZView(),
                            label: {
                                Text("Sample Z")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleAAView(),
                            label: {
                                Text("Sample AA")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
                                    .padding(.leading, 24)
                            })
                        Divider()
                        NavigationLink(
                            destination: SampleABView(),
                            label: {
                                Text("Sample AB")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.textPrimary)
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
