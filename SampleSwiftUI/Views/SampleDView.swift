//
//  SampleDView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

// ObservedObjectのサンプルコード
struct SampleDView: View {

    @ObservedObject var viewModel: SampleCViewModel

    var body: some View {
        // リアルタイムで値変動が起きる
        SampleDRow(viewModel: viewModel)
    }
}

struct SampleDView_Previews: PreviewProvider {
    static var previews: some View {
        SampleDView(viewModel: SampleCViewModel())
    }
}
