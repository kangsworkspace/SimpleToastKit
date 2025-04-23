//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import Foundation
import SwiftUI

/// A protocol that defines the animation and transition used in a toast presentation.
///
/// The protocol has ``STKAnimation/transition`` to use with SwiftUI view transitions,
/// and an ``STKAnimation/animation`` that determines how the transition is animated.
public protocol STKAnimation {
    /// The SwiftUI transition to be applied when the toast appears or disappears.
    var transition: AnyTransition { get }
    /// The animation used during the transition.
    var animation: Animation { get }
}


/// Predefined animation styles for presenting and dismissing toast views.
///
/// Each style maps to a concrete implementation of the ``STKAnimation`` protocol.
public enum STKAnimationStyle {
    /// Basic fade in/out animation using opacity
    case fade
    
    /// Appears from the front and fades out toward the back, using a combination of scale and opacity transitions.
    case scaledFade
    
    /// Slides in from the bottom and exits to the bottom. using move and opacity
    case slideBottom
    
    /// Slides in from the left and exits to the left. using move and opacity
    case slideLeft
    
    /// Slides in from the right and exits to the right. using move and opacity
    case slideRight
    
    /// The concrete `STKAnimation` associated with the selected style.
    var animation: STKAnimation {
        switch self {
        case .fade:
            return FadeAnimation()
        case .scaledFade:
            return ScaledFadeAnimation()
        case .slideBottom:
            return SlideBottomAnimation()
        case .slideLeft:
            return SlideLeftAnimation()
        case .slideRight:
            return SlideRightAnimation()
        }
    }
}

struct FadeAnimation: STKAnimation {
    var transition: AnyTransition = .opacity
    var animation: Animation = .easeInOut(duration: 0.3)
}

struct ScaledFadeAnimation: STKAnimation {
    var transition: AnyTransition = .asymmetric(
        insertion: .scale(scale: 1.2).combined(with: .opacity),
        removal: .scale(scale: 0.8).combined(with: .opacity)
    )
    
    var animation: Animation = .easeInOut(duration: 0.3)
}

struct SlideBottomAnimation: STKAnimation {
    var transition: AnyTransition = .move(edge: .bottom).combined(with: .opacity)
    var animation: Animation = .spring(duration: 0.4, bounce: 0.1)
}

struct SlideLeftAnimation: STKAnimation {
    var transition: AnyTransition = .move(edge: .leading).combined(with: .opacity)
    var animation: Animation = .easeInOut(duration: 0.4)
}

struct SlideRightAnimation: STKAnimation {
    var transition: AnyTransition = .move(edge: .trailing).combined(with: .opacity)
    var animation: Animation = .easeInOut(duration: 0.4)
}
