//
//  STKAnimationStyle.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/26/25.
//
import Foundation
import SwiftUI

/// Predefined animation styles for presenting and dismissing toast views.
///
/// Each style maps to a concrete implementation of the `STKAnimationProtocol`
public enum STKAnimationStyle {
    /// No animation
    case none
    /// Basic fade in/out animation using opacity
    case fade
    /// Appears from the front and fades out toward the back, using a combination of scale and opacity transitions.
    case scaledFade
    /// Slides in from the top and exits to the top. using move and opacity
    case slideTop
    /// Slides in from the left and exits to the left. using move and opacity
    case slideBottom
    /// Slides in from the left and exits to the left. using move and opacity
    case slideLeft
    /// Slides in from the right and exits to the right. using move and opacity
    case slideRight
}


extension STKAnimationStyle: STKAnimationProtocol {
    /// The SwiftUI transition associated with the animation style.
    ///
    /// Determines how the toast view appears and disappears based on the selected style.
    public var transition: AnyTransition {
        switch self {
        case .none:
            return AnyTransition.identity
        case .fade:
            return AnyTransition.opacity
        case .scaledFade:
            return AnyTransition.asymmetric(
                    insertion: .scale(scale: 1.2).combined(with: .opacity),
                    removal: .scale(scale: 0.8).combined(with: .opacity))
        case .slideTop:
            return AnyTransition.move(edge: .top).combined(with: .opacity)
        case .slideBottom:
            return AnyTransition.move(edge: .bottom).combined(with: .opacity)
        case .slideLeft:
            return AnyTransition.move(edge: .leading).combined(with: .opacity)
        case .slideRight:
            return AnyTransition.move(edge: .trailing).combined(with: .opacity)
        }
    }
    
    /// The SwiftUI animation associated with the animation style.
    ///
    /// Defines the timing and motion effect used during the transition.
    public var animation: Animation {
        switch self {
        case .none:
            return .default
        case .fade:
            return .easeInOut(duration: 0.3)
        case .scaledFade:
            return Animation.easeInOut(duration: 0.3)
        case .slideTop:
            return Animation.easeInOut(duration: 0.3)
        case .slideBottom:
            return Animation.easeInOut(duration: 0.3)
        case .slideLeft:
            return Animation.easeInOut(duration: 0.3)
        case .slideRight:
            return Animation.easeOut(duration: 0.3)
        }
    }
}
