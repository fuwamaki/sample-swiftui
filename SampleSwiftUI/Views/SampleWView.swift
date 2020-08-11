//
//  SampleWView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/08.
//

import SwiftUI

struct SampleWView: View {
    @State var images: [UIImage] = []
    @State var isDragging: Bool = false

    var body: some View {
        ZStack {
            if isDragging {
                Color.gray
                    .edgesIgnoringSafeArea(.all)
            }
            HStack {
                VStack {
                    Text("Driver")
                        .blur(radius: isDragging ? 10.0 : 0.0)
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
                    .background(Color.backgroundSecondary)
                    .cornerRadius(13.0)
                    .onDrop(of: ["public.image"],
                            delegate: WMyDropDelegate(images: $images, isDragging: $isDragging))
                    VStack {
                        Image(systemName: "car")
                            .resizable()
                            .frame(width: 60, height: 60)
                        Text("Car")
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.backgroundSecondary)
                    .cornerRadius(13.0)
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
                    .padding(8.0)
                    .background(Color.backgroundPrimary)
                    .cornerRadius(8.0)
                    .onDrag {
                        let provider = NSItemProvider(object: UIImage(systemName: "home") ?? UIImage())
                        provider.suggestedName = "Taro"
                        print("startDrag")
                        self.isDragging.toggle()
                        let generator = UINotificationFeedbackGenerator()
                        generator.notificationOccurred(.error)
                        return provider
                    }
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text("Hanako")
                            .font(.title)
                    }
                    .padding(8.0)
                    .background(Color.backgroundPrimary)
                    .cornerRadius(8.0)
                    .onDrag {
                        let provider = NSItemProvider(object: UIImage(systemName: "home") ?? UIImage())
                        provider.suggestedName = "Hanako"
                        print("startDrag")
                        self.isDragging.toggle()
                        let generator = UIImpactFeedbackGenerator(style: .heavy)
                        generator.prepare()
                        generator.impactOccurred()
                        return provider
                    }
                    Spacer()
                }
                .padding(.leading, 60)
                .blur(radius: isDragging ? 10.0 : 0.0)
            }
        }
        
    }
}

struct WMyDropDelegate: DropDelegate {
    @Binding var images: [UIImage]
    @Binding var isDragging: Bool

    func performDrop(info: DropInfo) -> Bool {
        if let item = info.itemProviders(for: ["public.image"]).first {
            item.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    self.images.append(image)
//                    print(item.suggestedName)
                    self.isDragging.toggle()
                }
            }
            return true
        } else {
            return false
        }
    }
    func dropEntered(info: DropInfo) {
        print("dropEntered")
    }
    func dropUpdated(info: DropInfo) -> DropProposal? {
        print("dropUpdate")
        return nil
    }
    func dropExited(info: DropInfo) {
        print("dropExited")
    }
    func validateDrop(info: DropInfo) -> Bool {
        print("dropValidate")
        return true
    }
}

struct SampleWView_Previews: PreviewProvider {
    static var previews: some View {
        SampleWView()
    }
}
