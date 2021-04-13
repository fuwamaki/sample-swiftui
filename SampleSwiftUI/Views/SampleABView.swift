//
//  SampleABView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2021/04/08.
//

import SwiftUI

struct SampleABView: View {
    var body: some View {
        VStack {
            Button(action: {
            }, label: {
                Text("i")
                    .frame(width: 24.0, height: 24.0)
                    .padding(2.0)
                    .font(.subheadline)
                    .foregroundColor(Color.textSecondary)
            })
            .buttonStyle(NeumorphicNormalButtonStyle
                            .make(cornerRadiusValue: 13.0))
            ZStack(alignment: .trailing, content: {
                Text("Placeholder")
                Text("あああ")
            })
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
            })
        }
        
    }
}

struct SampleABView_Previews: PreviewProvider {
    static var previews: some View {
        SampleABView()
    }
}

struct NeumorphicNormalButtonStyle: ButtonStyle {
    var backgroundColor: Color = .backgroundPrimary
    var pressedBackgroundColor: Color = .backgroundTertiary
    var upsideShadowColor: Color = .white
    var downsideShadowColor: Color = .gray
    var cornerRadiusValue: CGFloat = 16.0

    static func make(backgroundColor: Color = .backgroundPrimary,
                     pressedBackgroundColor: Color = .backgroundTertiary,
                     upsideShadowColor: Color = .white,
                     downsideShadowColor: Color = .gray,
                     cornerRadiusValue: CGFloat = 16.0) -> NeumorphicNormalButtonStyle {
        var buttonStyle = NeumorphicNormalButtonStyle()
        buttonStyle.backgroundColor = backgroundColor
        buttonStyle.pressedBackgroundColor = pressedBackgroundColor
        buttonStyle.upsideShadowColor = upsideShadowColor
        buttonStyle.downsideShadowColor = downsideShadowColor
        buttonStyle.cornerRadiusValue = cornerRadiusValue
        return buttonStyle
    }

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed
                            ? pressedBackgroundColor
                            : backgroundColor)
            .cornerRadius(cornerRadiusValue)
            .shadow(color: downsideShadowColor, radius: 5.0, x: 5.0, y: 5.0)
            .shadow(color: upsideShadowColor, radius: 5.0, x: -5.0, y: -5.0)
    }
}
