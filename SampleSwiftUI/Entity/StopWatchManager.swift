//
//  StopWatchManager.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/13.
//

import Foundation

class StopWatchManeger: ObservableObject {

    enum stopWatchMode {
        case start
        case stop
        case pause
    }

    @Published var mode:stopWatchMode = .stop
    @Published var secondsElapsed = 0.0
    var timer = Timer()

    func start() {
        mode = .start
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ timer in
            self.secondsElapsed += 0.1
        }
    }

    func stop() {
        timer.invalidate()
        secondsElapsed = 0
        mode = .stop
    }

    func pause() {
        timer.invalidate()
        mode = .pause
    }
}
