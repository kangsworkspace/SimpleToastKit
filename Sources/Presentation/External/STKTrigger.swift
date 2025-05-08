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
    ///   - content: A view builder closure that provides the custom content for the toast.
    @MainActor
    func show<Content: View>(
        holdSec: Double,
        animationStyle: STKAnimationStyle,
        @ViewBuilder content: () -> Content
    )
    
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - Parameters:
    ///   - simpleToast: A ``SimpleToast`` type struct.
    @MainActor
    func showSimple(
        simpleToast: () -> SimpleToast
    )
}

// MARK: - Convenience Overloads for show()

public extension STKTrigger {
    @MainActor
    func show<Content: View>(
        holdSec: Double,
        animationStyle: STKAnimationStyle,
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: holdSec,
            animationStyle: animationStyle,
            content: content
        )
    }
    
    @MainActor
    func show<Content: View>(
        holdSec: Double,
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: holdSec,
            animationStyle: .fade,
            content: content
        )
    }
    
    @MainActor
    func show<Content: View>(
        animationStyle: STKAnimationStyle,
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: 1.4,
            animationStyle: animationStyle,
            content: content
        )
    }
    
    @MainActor
    func show<Content: View>(
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: 1.4,
            animationStyle: .fade,
            content: content
        )
    }
}
