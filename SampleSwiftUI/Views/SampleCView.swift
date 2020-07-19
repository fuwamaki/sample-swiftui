//
//  SampleCView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/17.
//

import SwiftUI

// .constantを用いるObservedObjectのサンプルコード
struct SampleCView: View {
    @ObservedObject(initialValue: SampleCViewModel()) var viewModel: SampleCViewModel

    var body: some View {
        // リアルタイムで値変動が起きる
        SampleRow(viewModel: .constant(viewModel))
    }
}

struct SampleCView_Previews: PreviewProvider {
    static var previews: some View {
        SampleCView()
    }
}
