//
//  SwiftUIView.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text(
                "Hello, World!"
            )
            Button {
                STK.shared.showToastView(holdSec: 1.0) {
                    Text("이것이 토스트뷰우우")
                }
            } label: {
                Text("토스트 뷰 보여주는 버튼")
                    .foregroundStyle(Color.black)
            }
        }
        .toastable()
    }
}

#Preview {
    SwiftUIView()
}
