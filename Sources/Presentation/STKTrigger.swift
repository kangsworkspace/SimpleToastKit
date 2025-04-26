////
////  File.swift
////  SimpleToastKit
////
////  Created by 강건 on 4/25/25.
////

import SwiftUI

/// A protocol that defines the interface for triggering toast view presentations.
///
/// `STKTrigger` provides a method for external users to present custom toast views
/// with configurable duration, animation style, and animation behavior.
///
/// >Note:
///   This protocol is intended for public use and acts as the main entry point for triggering toasts.
public protocol STKTrigger {
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - Parameters:
    ///   - holdSec: The number of seconds the toast view remains visible.
    ///   - animationStyle: The animation style used for presenting and dismissing the toast.
    ///   - animated: A Boolean value indicating whether to animate the appearance and disappearance.
    ///   - content: A view builder closure that provides the custom content for the toast.
    @MainActor
    func showToastView<Content: View>(
        holdSec: Double,
        animationStyle: STKAnimationStyle,
        animated: Bool,
        @ViewBuilder content: () -> Content
    )
}

public extension STKTrigger {
    /// Displays a toast view with the specified duration and animation style, using default animation behavior.
    ///
    /// The toast view will animate by default.
    @MainActor
    func showToastView<Content: View>(
        holdSec: Double,
        animationStyle: STKAnimationStyle,
        @ViewBuilder content: () -> Content
    ) {
        showToastView(
            holdSec: holdSec,
            animationStyle: animationStyle,
            animated: true,
            content: content
        )
    }
    
    /// Displays a toast view with the specified duration, using the default fade animation style and animation behavior.
    @MainActor
    func showToastView<Content: View>(
        holdSec: Double,
        @ViewBuilder content: () -> Content
    ) {
        showToastView(
            holdSec: holdSec,
            animationStyle: .fade,
            animated: true,
            content: content
        )
    }
    
    /// Displays a toast view with specified animation
    ///
    /// Uses a duration of 1.4 seconds, and animation enabled.
    @MainActor
    func showToastView<Content: View>(
        animationStyle: STKAnimationStyle,
        @ViewBuilder content: () -> Content
    ) {
        showToastView(
            holdSec: 1.4,
            animationStyle: animationStyle,
            animated: true,
            content: content
        )
    }
    
    /// Displays a toast view with default settings.
    ///
    /// Uses a duration of 1.4 seconds, a fade animation style, and animation enabled.
    @MainActor
    func showToastView<Content: View>(
        @ViewBuilder content: () -> Content
    ) {
        showToastView(
            holdSec: 1.4,
            animationStyle: .fade,
            animated: true,
            content: content
        )
    }
}
