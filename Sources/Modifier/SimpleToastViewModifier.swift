//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import Foundation
import SwiftUI

/// Makes the view toastable.
///
/// This modifier enables the view to display toast view using the `STK` class,
/// and applies toast animation effects.
/// > Important: You must make the view toastable to use `SimpleToastKit`.
/// - Returns: Returns A view modified with `ToastViewModifier`
public struct ToastViewModifier: ViewModifier {
    @ObservedObject var stk = STK.shared
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            if stk.isPresented {
                VStack {
                    Spacer()
                    
                    stk.toastContent
                }
                .transition(stk.animation.transition)
            }
        }
    }
}
