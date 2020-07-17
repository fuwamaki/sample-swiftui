//
//  SampleDRow.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

struct SampleDRow: View {

    @ObservedObject var viewModel: SampleCViewModel

    var body: some View {
        Toggle(isOn: $viewModel.isEnabled) {
            Text("The value is " + "\(viewModel.isEnabled)")
        }
    }
}

struct SampleDRow_Previews: PreviewProvider {
    static var previews: some View {
        SampleDRow(viewModel: SampleCViewModel())
    }
}
