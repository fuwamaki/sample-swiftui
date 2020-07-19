//
//  SampleAView.swift
//  SampleSwiftUI
//
//  Created by yusaku maki on 2020/07/16.
//

import SwiftUI

// 失敗ケース
struct SampleAView: View {

    @EnvironmentObject var viewModel: SampleViewModel

    var body: some View {
        // リアルタイムで値変動しない。Navigation戻って再表示すると正しい
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
