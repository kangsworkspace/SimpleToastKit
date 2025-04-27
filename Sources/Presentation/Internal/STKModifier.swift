////
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/25/25.
//

import SwiftUI

/// Makes the view toastable.
///
/// This modifier enables the view to display toast view using the `STK` class,
/// and applies toast animation effects.
/// > Important: You must make the view toastable to use `SimpleToastKit`.
/// - Returns: Returns A view modified with `ToastViewModifier`
internal struct STKModifier<ToastState: STKStateProvider>: ViewModifier {
    @ObservedObject var toastState: ToastState
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            if toastState.isToastActive {
                VStack {
                    Spacer()
                    
                    toastState.toastContent
                }
                .transition(toastState.animationStyle.transition)
            }
        }
    }
}
