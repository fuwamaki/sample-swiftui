//
//  SampleEViewModel.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import Foundation

class SampleEViewModel: ObservableObject {

    @Published var entities: [SampleEEntity] = [SampleEEntity(), SampleEEntity()]
}

class SampleEEntity: ObservableObject {
    @Published var isEnabled: Bool = false
}
