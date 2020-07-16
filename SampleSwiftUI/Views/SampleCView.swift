//
//  SampleCView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

struct SampleCView: View {
    @ObservedObject(initialValue: SampleCViewModel()) var viewModel: SampleCViewModel

    var body: some View {
        // リアルタイムで値変動が起きる
        Toggle(isOn: $viewModel.isEnabled) {
            Text("The value is " + "\(viewModel.isEnabled)")
        }
    }
}

struct SampleCView_Previews: PreviewProvider {
    static var previews: some View {
        SampleRow(viewModel: .constant(SampleCViewModel()))
    }
}