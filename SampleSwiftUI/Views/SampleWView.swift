//
//  SampleWView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/08.
//

import SwiftUI

struct SampleWView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Driver")
                VStack {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text("Home")
                }
                .frame(width: 100, height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.gray, lineWidth: 1))
                VStack {
                    Image(systemName: "car")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text("Car")
                }
                .frame(width: 100, height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.gray, lineWidth: 1))
                Spacer()
            }
            VStack {
                Text("Home")
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Taro")
                        .font(.title)
                }
                .onDrag {
                    let provider = NSItemProvider(object: UIImage(systemName: "home") ?? UIImage())
                    provider.suggestedName = "Taro"
                    return provider
                }
                Spacer()
            }
            .padding(.leading, 60)
        }
    }
}

struct SampleWView_Previews: PreviewProvider {
    static var previews: some View {
        SampleWView()
    }
}
