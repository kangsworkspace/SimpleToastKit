//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import Foundation
import SwiftUI

@MainActor
final class STK: ObservableObject {
    static let shared = STK()
    private init(){}
    
    @Published var isPresented: Bool = false
    @Published var toastContent: AnyView = AnyView(EmptyView())
    @Published var animation: STKAnimation = FadeAnimation()
    private var isFloated: Bool = false
    
    func showToastView(holdSec: Double = 2.0,
                       animation: STKAnimationStyle = .fade,
                       animated: Bool = true,
                       @ViewBuilder content: @escaping () -> some View
    ) {
        guard !isFloated else { return }
        isFloated = true
        
        toastContent = AnyView(content())
        self.animation = animation.animation
        
        if animated {
            withAnimation(self.animation.animation){
                isPresented = true
            }
            Task {
                try? await Task.sleep(nanoseconds: UInt64(holdSec * 1_000_000_000))
                
                withAnimation(self.animation.animation){
                    isPresented = false
                    isFloated = false
                }
            }
        } else {
            isPresented = true
            
            Task {
                try? await Task.sleep(nanoseconds: UInt64(holdSec * 1_000_000_000))
                
                isPresented = false
                isFloated = false
            }
        }
    }
}
