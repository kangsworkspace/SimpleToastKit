//
//  that.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/26/25.
//


import SwiftUI

/// A protocol that defines the animation and transition used in a toast presentation.
///
/// The protocol has ``STKAnimationProtocol/transition`` to use with SwiftUI view transitions,
/// and an ``STKAnimationProtocol/animation`` that determines how the transition is animated.
internal protocol STKAnimationProtocol {
    /// The SwiftUI transition to be applied when the toast appears or disappears.
    var transition: AnyTransition { get }
    /// The animation used during the transition.
    var animation: Animation { get }
}
