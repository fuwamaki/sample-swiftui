//
//  SampleGView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/18.
//

import SwiftUI

struct SampleGView: View {

    @State private var fullText: String = "This is some editable text..."

    var body: some View {
        TextEditor(text: $fullText)
            .frame(width: UIScreen.main.bounds.width-24, height: 180)
            .overlay(RoundedRectangle(cornerRadius: 8.0)
                        .stroke(Color.secondary, lineWidth: 1))
    }
}

struct SampleGView_Previews: PreviewProvider {
    static var previews: some View {
        SampleGView()
    }
}
