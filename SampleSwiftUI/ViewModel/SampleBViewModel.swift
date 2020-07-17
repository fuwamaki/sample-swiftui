//
//  SampleBViewModel.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import Combine

// old
class SampleBViewModel: ObservableObject {

    let willChange = PassthroughSubject<SampleBViewModel, Never>()

    var isEnabled = false {
        willSet {
            willChange.send(self)
        }
    }
}
