//
//  SampleEView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

struct SampleEView: View {

    @ObservedObject var viewModel: SampleEViewModel

    var body: some View {
        SampleERow(viewModel: viewModel)
    }
}

struct SampleEView_Previews: PreviewProvider {
    static var previews: some View {
        SampleEView(viewModel: SampleEViewModel())
    }
}
