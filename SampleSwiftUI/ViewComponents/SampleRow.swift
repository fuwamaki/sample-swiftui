//
//  SampleRow.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

struct SampleRow: View {

    @Binding var viewModel: SampleCViewModel

    var body: some View {
        Toggle(isOn: $viewModel.isEnabled) {
            Text("The value is " + "\(viewModel.isEnabled)")
        }
    }
}

struct SampleRow_Previews: PreviewProvider {
    static var previews: some View {
        SampleRow(viewModel: .constant(SampleCViewModel()))
    }
}
