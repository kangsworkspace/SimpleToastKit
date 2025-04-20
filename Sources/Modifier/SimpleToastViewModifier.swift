//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import Foundation
import SwiftUI

struct ToastViewModifier: ViewModifier {
    @ObservedObject var stk = STK.shared
    
    func body(content: Content) -> some View {
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
