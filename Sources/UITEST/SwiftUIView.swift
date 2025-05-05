//
//  SwiftUIView.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State var showRec: Bool = false
    var body: some View {
        VStack {
            Button {
                STK.toast.show(holdSec: 1.0, animationStyle: .slideBottom) {
                    SampleTastView()
                }
            } label: {
                Text("Show Toast View")
                    .foregroundStyle(Color.black)
            }
            
            Button {
                STK.toast.showSimple {
                    SimpleToast(message: "Message is required")
                        .toastShape(
                            .roundedRectangle(
                                leadingImage: Image("ToastKitImage", bundle: .module)
                            )
                        )
                }
            } label: {
                Text("Show Simple Toast View")
                    .foregroundStyle(Color.black)
            }
        }
        .toastable()
    }
    
    struct SampleTastView: View {
        var body: some View {
            Text("Let's Do Toast View")
                .foregroundStyle(Color.white)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color.black)
                }
        }
    }
}

#Preview {
    SwiftUIView()
}

/// (2)하단, 중앙, 상단 토스트뷰 파라미터로 넣을 수 있게 하기
/// (3)파라미터로 클릭하면 토스트뷰 바로 사라질 수 있게 하기
/// (5)기본 토스트뷰의 스타일 제공해주기
/// (6)삭제 버튼은 후순위
/// (7)외부 뷰에서 바인딩으로 True False 할 수 있도록 하기
