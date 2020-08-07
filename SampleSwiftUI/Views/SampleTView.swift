//
//  SampleTView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/07.
//

import SwiftUI

struct SampleTView: View {
    let img1url = Bundle.main.url(forResource: "lemon", withExtension: "jpg")!
    let img2url = Bundle.main.url(forResource: "apple", withExtension: "jpg")!
    let img3url = Bundle.main.url(forResource: "blueberry", withExtension: "jpg")!
    let img4url = Bundle.main.url(forResource: "orange", withExtension: "jpg")!

    var body: some View {
        HStack {
            VStack {
                DragableImage(url: img1url)
                DragableImage(url: img2url)
            }
            VStack {
                DragableImage(url: img3url)
                DragableImage(url: img4url)
            }
            DroppableArea()
        }.padding(40)
    }
}

struct DragableImage: View {
    let url: URL

    var body: some View {
        Image(uiImage: UIImage(contentsOfFile: url.path)!)
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .padding(2)
            .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
            .shadow(radius: 3)
            .padding(4)
            .onDrag { return NSItemProvider(object: self.url as NSURL) }
    }
}

struct DroppableArea: View {
    @State private var imageUrls: [Int: URL] = [:]
    @State private var active = 0

    var body: some View {
        let dropDelegate = MyDropDelegate(imageUrls: $imageUrls, active: $active)
        return VStack {
            HStack {
                GridCell(active: self.active == 1, url: imageUrls[1])
                GridCell(active: self.active == 3, url: imageUrls[3])
            }
            HStack {
                GridCell(active: self.active == 2, url: imageUrls[2])
                GridCell(active: self.active == 4, url: imageUrls[4])
            }
        }
        .background(Rectangle().fill(Color.gray))
        .frame(width: 300, height: 300)
        .onDrop(of: ["public.file-url"], delegate: dropDelegate)
    }
}

struct GridCell: View {
    let active: Bool
    let url: URL?

    var body: some View {
        let img = Image(uiImage: UIImage(contentsOfFile: url?.path ?? "") ?? UIImage())
            .resizable()
            .frame(width: 150, height: 150)
        return Rectangle()
            .fill(self.active ? Color.green : Color.clear)
            .frame(width: 150, height: 150)
            .overlay(img)
    }
}

struct MyDropDelegate: DropDelegate {
    @Binding var imageUrls: [Int: URL]
    @Binding var active: Int

    func dropEntered(info: DropInfo) {
        print("dropEntered")
    }

    func performDrop(info: DropInfo) -> Bool {
        let gridPosition = getGridPosition(location: info.location)
        self.active = gridPosition
        print("performDrop")
        if let item = info.itemProviders(for: ["public.file-url"]).first {
            item.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (urlData, error) in
                DispatchQueue.main.async {
                    if let urlData = urlData as? Data {
                        let aaa = NSURL(absoluteURLWithDataRepresentation: urlData, relativeTo: nil) as URL
                        // なぞの前後文字が入ってきていて、ちゃんと取り出せない
                        let bbb = aaa.absoluteString.firstIndex(of: "f")!
                        let ccc = String(aaa.absoluteString[bbb...])
                        let ddd = String(ccc[...ccc.firstIndex(of: "g")!])
                        self.imageUrls[gridPosition] = URL(string: ddd)
                    }
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

struct SampleTView_Previews: PreviewProvider {
    static var previews: some View {
        SampleTView()
            .previewLayout(.fixed(width:896, height: 414))
    }
}
