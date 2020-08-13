//
//  SampleZView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/13.
//

import SwiftUI

struct SampleZView: View {
    @ObservedObject var stopWatchManeger = StopWatchManeger()

    var body: some View {
        VStack {
            Text(String(format:"%.1f", stopWatchManeger.secondsElapsed))
                .padding(.top, 200)
                .padding(.bottom, 100)
                .padding(.trailing, 100)
                .padding(.leading, 100)

            switch stopWatchManeger.mode {
            case .start:
                Button(action: {
                    self.stopWatchManeger.pause()
                }) {
                    Text("Pause")
                }
            case .pause:
                Button(action: {
                    self.stopWatchManeger.start()
                }) {
                    Text("Start")
                }
                Button(action: {
                    self.stopWatchManeger.stop()
                }) {
                    Text("Stop")
                }
                .padding(.top, 10)
            case .stop:
                Button(action: {
                    self.stopWatchManeger.start()
                }) {
                    Text("Start")
                }
            }
            Spacer()
        }
    }
}

struct SampleZView_Previews: PreviewProvider {
    static var previews: some View {
        SampleZView()
    }
}
