//
//  StopWatchManager.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/08/13.
//

import Foundation

enum StopWatchMode {
    case start
    case stop
    case pause
}

class StopWatchManeger: ObservableObject {

    @Published var mode: StopWatchMode = .stop
    @Published var secondsElapsed = 0.0
    var timer = Timer()

    func start() {
        mode = .start
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.secondsElapsed += 1.0
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
