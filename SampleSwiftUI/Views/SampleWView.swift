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
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text("Home")
                    Text(String(images.count))
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
        let gridPosition = getGridPosition(location: info.location)
        print("WperformDrop")
        if let item = info.itemProviders(for: ["public.image"]).first {
            item.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    self.images.append(image)
                }
            }
            return true
        } else {
            return false
        }
    }

    private func getGridPosition(location: CGPoint) -> Int {
        let x = location.x - 464.0
        let y = location.y - 65.0
        if x > 150 && y > 150 {
            return 4
        } else if x > 150 && y < 150 {
            return 3
        } else if x < 150 && y > 150 {
            return 2
        } else if x < 150 && y < 150 {
            return 1
        } else {
            return 0
        }
    }
}

struct SampleWView_Previews: PreviewProvider {
    static var previews: some View {
        SampleWView()
    }
}
