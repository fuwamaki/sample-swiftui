//
//  SampleAView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/16.
//

import SwiftUI

struct SampleAView: View {

    @EnvironmentObject var viewModel: SampleViewModel

    var body: some View {
        // うまく動作しない
        Toggle(isOn: $viewModel.isEnabled) {
            Text("The value is " + "\(viewModel.isEnabled)")
        }
    }
}

struct SampleAView_Previews: PreviewProvider {
    static var previews: some View {
        SampleAView()
            .environmentObject(SampleViewModel())
    }
}
