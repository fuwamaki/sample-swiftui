//
//  SampleUView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/08.
//

import SwiftUI

struct SampleUView: View {
    var body: some View {
        HStack {
            VStack {
                UDragableImage(name: "lemon")
                UDragableImage(name: "apple")
            }
            VStack {
                UDragableImage(name: "blueberry")
                UDragableImage(name: "orange")
            }
            UDroppableArea()
        }.padding(40)
    }
}

struct UDragableImage: View {
    let name: String

    var body: some View {
        Image(name)
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .padding(2)
            .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
            .shadow(radius: 3)
            .padding(4)
            .onDrag { return NSItemProvider(object: UIImage(named: name)!) }
    }
}

struct UDroppableArea: View {
    @State private var images: [Int: UIImage] = [:]
    @State private var active = 0

    var body: some View {
        let dropDelegate = UMyDropDelegate(images: $images, active: $active)
        return VStack {
            HStack {
                UGridCell(active: self.active == 1, image: images[1])
                UGridCell(active: self.active == 3, image: images[3])
            }
            HStack {
                UGridCell(active: self.active == 2, image: images[2])
                UGridCell(active: self.active == 4, image: images[4])
            }
        }
        .background(Rectangle().fill(Color.gray))
        .frame(width: 300, height: 300)
        .onDrop(of: ["public.image"], delegate: dropDelegate)
    }
}

struct UGridCell: View {
    let active: Bool
    let image: UIImage?

    var body: some View {
        let img = Image(uiImage: image ?? UIImage())
            .resizable()
            .frame(width: 150, height: 150)
        return Rectangle()
            .fill(self.active ? Color.green : Color.clear)
            .frame(width: 150, height: 150)
            .overlay(img)
    }
}

struct UMyDropDelegate: DropDelegate {
    @Binding var images: [Int: UIImage]
    @Binding var active: Int

    func dropEntered(info: DropInfo) {
        print("dropEntered")
    }

    func performDrop(info: DropInfo) -> Bool {
        let gridPosition = getGridPosition(location: info.location)
        self.active = gridPosition
        print("performDrop")
        if let item = info.itemProviders(for: ["public.image"]).first {
            item.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    self.images[gridPosition] = image
                }
            }
            return true
        } else {
            return false
        }
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        print("dropUpdated")
        self.active = getGridPosition(location: info.location)
        return nil
    }

    func dropExited(info: DropInfo) {
        print("dropExist")
        self.active = 0
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

struct SampleUView_Previews: PreviewProvider {
    static var previews: some View {
        SampleUView()
    }
}
