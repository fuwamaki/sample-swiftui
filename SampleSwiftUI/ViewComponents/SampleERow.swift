//
//  SampleERow.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

struct SampleERow: View {
    @ObservedObject var viewModel: SampleEViewModel

    var body: some View {
        List {
            ForEach(viewModel.entities.indices, id: \.self) { index in
                Toggle(isOn: self.$viewModel.entities[index].isEnabled) {
                    Text("The value is " + "\(self.viewModel.entities[index].isEnabled)")
                }
            }
        }
    }
}

struct SampleERow_Previews: PreviewProvider {
    static var previews: some View {
        SampleERow(viewModel: SampleEViewModel())
    }
}
