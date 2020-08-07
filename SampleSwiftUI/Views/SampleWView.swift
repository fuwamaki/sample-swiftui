//
//  SampleWView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/08.
//

import SwiftUI

struct SampleWView: View {
    @State var images: [UIImage] = []

    var body: some View {
        HStack {
            VStack {
                Text("Driver")
                VStack {
                    ZStack {
                        VStack {
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 60, height: 60)
                            Text("Home")
                        }
                        if (images.count > 0) {
                            Text(String(images.count))
                                .frame(width: 30, height: 30)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .font(.headline)
                                .cornerRadius(15.0)
                                .padding(.bottom, 62)
                                .padding(.leading, 48)
                        }
                    }
                }
                .frame(width: 100, height: 100)
                .overlay(RoundedRectangle(cornerRadius: 8.0)
                            .stroke(Color.gray, lineWidth: 1))
                .onDrop(of: ["public.image"],
                        delegate: WMyDropDelegate(images: $images))
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

struct WMyDropDelegate: DropDelegate {
    @Binding var images: [UIImage]

    func performDrop(info: DropInfo) -> Bool {
        if let item = info.itemProviders(for: ["public.image"]).first {
            item.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    self.images.append(image)
                    print(item.suggestedName)
                }
            }
            return true
        } else {
            return false
        }
    }
}

struct SampleWView_Previews: PreviewProvider {
    static var previews: some View {
        SampleWView()
    }
}
