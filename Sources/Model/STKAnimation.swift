//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import Foundation
import SwiftUI

protocol STKAnimation {
    var transition: AnyTransition { get }
    var animation: Animation { get }
}

enum STKAnimationStyle {
    case fade
    case scaledFade
    case slideBottom
    case slideLeft
    case slideRight

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
