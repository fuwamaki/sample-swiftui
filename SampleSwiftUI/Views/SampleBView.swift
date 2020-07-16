//
//  SampleBView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

struct SampleBView: View {
    @ObservedObject(initialValue: SampleBViewModel()) var viewModel: SampleBViewModel

    var body: some View {
        Toggle(isOn: $viewModel.isEnabled) {
            Text("The value is " + "\(viewModel.isEnabled)")
        }
    }
}

struct SampleBView_Previews: PreviewProvider {
    static var previews: some View {
        SampleBView()
    }
}
