//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import Foundation
import SwiftUI



/// A singleton class that manages the presentation of toast views.
///
/// Use the `STK` class to easily create and configure simple toast views.
@MainActor
public final class STK: ObservableObject {
    static let shared = STK()
    private init(){}
    
    @Published private(set) var isPresented: Bool = false
    @Published private(set) var toastContent: AnyView = AnyView(EmptyView())
    @Published private(set) var animation: STKAnimation = FadeAnimation()
    private var isFloated: Bool = false
    
    /// Displays a toast view with the specified content and animation.
    ///
    /// This method presents a toast view for a given duration. If `animated` is true,
    /// the presentation and dismissal will use the selected animation style.
    ///
    /// - Parameters:
    ///   - holdSec: The number of seconds the toast remains visible. Defaults to 1.4.
    ///   - animation: The style of animation used to present and dismiss the toast. Defaults to ``STKAnimationStyle/fade``.
    ///   - animated: Whether to animate the presentation and dismissal. Defaults to true
    ///   - content: A view builder that provides the content of the toast.
    public func showToastView(holdSec: Double = 1.4,
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
