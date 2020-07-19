//
//  SampleKView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/19.
//

import SwiftUI

struct SampleKView: View {
    @State private var bgColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)

    var body: some View {
        ColorPicker("Guides", selection: $bgColor)
    }
}

struct SampleKView_Previews: PreviewProvider {
    static var previews: some View {
        SampleKView()
    }
}
