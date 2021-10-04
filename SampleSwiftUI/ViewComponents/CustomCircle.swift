//
//  CustomCircle.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2021/10/04.
//

import SwiftUI

struct CustomCircle: View {
    @Binding var location: CGPoint

    var body: some View {
        Circle()
            .stroke(Color.red, lineWidth: 7)
            .frame(width: 64, height: 64)
            .position(location)
            .gesture(
                DragGesture().onChanged
                { value in
                    location = value.location
                }
            )
    }
}

struct CustomCircle_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircle(location: .constant(CGPoint(x: 100, y: 100)))
    }
}
