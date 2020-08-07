//
//  SampleVView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/08.
//

import SwiftUI

struct SampleVView: View {
    @State var selection: Set<UUID> = []

    @State private var fruitsTop = [
        Fruit(name: "Apple", image: "apple"),
        Fruit(name: "Blueberry", image: "blueberry"),
        Fruit(name: "Lemon", image: "lemon"),
        Fruit(name: "Orange", image: "orange")
    ]

    @State private var fruitsBottom = [
        Fruit(name: "Blueberry", image: "blueberry"),
        Fruit(name: "Orange", image: "orange"),
    ]

    var body: some View {
        VStack {
            NavigationView {
                List(selection: $selection) {
                    ForEach(fruitsTop) { fruit in
                        HStack {
                            Image(fruit.image)
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(fruit.name)
                        }
                        .onDrag {
                            let provider = NSItemProvider(object: UIImage(named: fruit.image) ?? UIImage())
                            provider.suggestedName = fruit.name
                            return provider
                        }
                    }
                    .onInsert(of: ["public.image"]) {
                        self.insertFruit(position: $0, itemProviders: $1, top: true)
                    }
                }
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle("Fruits (Top)")
            }

            NavigationView {
                List(selection: $selection) {
                    ForEach(fruitsBottom) { fruit in
                        HStack {
                            Image(fruit.image)
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                            Text(fruit.name)
                        }
                        .onDrag {
                            let provider = NSItemProvider(object: UIImage(named: fruit.image) ?? UIImage())
                            provider.suggestedName = fruit.name
                            return provider
                        }
                    }
                    .onInsert(of: ["public.image"]) {
                        self.insertFruit(position: $0, itemProviders: $1, top: false)
                    }
                }
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle("Fruits (Bottom)")
            }
        }
    }

    func insertFruit(position: Int, itemProviders: [NSItemProvider], top: Bool) {
        for item in itemProviders.reversed() {
            item.loadObject(ofClass: UIImage.self) { image, error in
                if let _ = image as? UIImage {
                    DispatchQueue.main.async {
                        let f = Fruit(name: item.suggestedName ?? "Unknown",
                                      image: item.suggestedName?.lowercased() ?? "unknown")
                        if top {
                            self.fruitsTop.insert(f, at: position)
                        } else {
                            self.fruitsBottom.insert(f, at: position)
                        }
                    }
                }
            }
        }
    }
}

fileprivate struct Fruit: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

struct SampleVView_Previews: PreviewProvider {
    static var previews: some View {
        SampleVView()
    }
}
