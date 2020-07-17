//
//  SampleViewModel.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import Combine

// old
class SampleViewModel: ObservableObject {

    let willChange = PassthroughSubject<SampleViewModel, Never>()

    var isEnabled = false {
        willSet {
            willChange.send(self)
        }
    }
}
