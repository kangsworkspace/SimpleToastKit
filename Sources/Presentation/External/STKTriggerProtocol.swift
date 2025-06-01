////
////  File.swift
////  SimpleToastKit
////
////  Created by 강건 on 4/25/25.
////

import SwiftUI

/// A protocol that defines the interface for triggering toast view presentations.
///
/// `STKTriggerProtocol` provides a method for external users to present custom toast views
/// with configurable duration, animation style, and animation behavior.
///
/// >Note:
///   This protocol is intended for public use and acts as the main entry point for triggering toasts.
public protocol STKTriggerProtocol {
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - Parameters:
    ///   - holdSec: The number of seconds the toast view remains visible.
    ///   - animationStyle: The animation style used for presenting and dismissing the toast.
    ///   - content: A view builder closure that provides the custom content for the toast.
    ///   - alignment: The position where the toast view will appear.
    @MainActor
    func show<Content: View>(
        holdSec: Double,
        animationStyle: STKAnimationStyle,
        alignment: STKAlignment,
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

public extension STKTriggerProtocol {
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - This overload uses the default holdSec (1.4 seconds) for the toast.
    ///
    /// - Parameters:
    ///   - animationStyle: The animation style used for presenting and dismissing the toast.
    ///   - content: A view builder closure that provides the custom content for the toast.
    ///   - alignment: The position where the toast view will appear.
    @MainActor
    func show<Content: View>(
        animationStyle: STKAnimationStyle,
        alignment: STKAlignment,
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: STKDefaults.holdSec,
            animationStyle: animationStyle,
            alignment: alignment,
            content: content,
        )
    }
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - This overload uses the default animationStyle `STKAnimationStyle.fade` for the toast.
    ///
    /// - Parameters:
    ///   - holdSec: The number of seconds the toast view remains visible.
    ///   - content: A view builder closure that provides the custom content for the toast.
    ///   - alignment: The position where the toast view will appear.
    @MainActor
    func show<Content: View>(
        holdSec: Double,
        alignment: STKAlignment,
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: holdSec,
            animationStyle: STKDefaults.animationStyle,
            alignment: alignment,
            content: content,
        )
    }
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - This overload uses the default alignment `STKAlignment.bottom` for the toast.
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
    ) {
        show(
            holdSec: holdSec,
            animationStyle: animationStyle,
            alignment: STKDefaults.alignemnt,
            content: content,
        )
    }
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - This overload uses the default holdSec (1.4 seconds) for the toast.
    /// - This overload uses the default animationStyle `STKAnimationStyle.fade` for the toast.
    ///
    /// - Parameters:
    ///   - content: A view builder closure that provides the custom content for the toast.
    ///   - alignment: The position where the toast view will appear.
    @MainActor
    func show<Content: View>(
        alignment: STKAlignment,
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: STKDefaults.holdSec,
            animationStyle: STKDefaults.animationStyle,
            alignment: alignment,
            content: content,
        )
    }
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - This overload uses the default holdSec (1.4 seconds) for the toast.
    /// - This overload uses the default alignment `STKAlignment.bottom` for the toast.
    ///
    /// - Parameters:
    ///   - animationStyle: The animation style used for presenting and dismissing the toast.
    ///   - content: A view builder closure that provides the custom content for the toast.
    @MainActor
    func show<Content: View>(
        animationStyle: STKAnimationStyle,
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: STKDefaults.holdSec,
            animationStyle: animationStyle,
            alignment: STKDefaults.alignemnt,
            content: content,
        )
    }
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - This overload uses the default animationStyle `STKAnimationStyle.fade` for the toast.
    /// - This overload uses the default alignment `STKAlignment.bottom` for the toast.
    ///
    /// - Parameters:
    ///   - holdSec: The number of seconds the toast view remains visible.
    ///   - content: A view builder closure that provides the custom content for the toast.
    @MainActor
    func show<Content: View>(
        holdSec: Double,
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: holdSec,
            animationStyle: STKDefaults.animationStyle,
            alignment: STKDefaults.alignemnt,
            content: content,
        )
    }
    
    /// Displays a toast view with the specified configuration.
    ///
    /// - This overload uses the default holdSec (1.4 seconds) for the toast.
    /// - This overload uses the default animationStyle `STKAnimationStyle.fade` for the toast.
    /// - This overload uses the default alignment `STKAlignment.bottom` for the toast.
    ///
    /// - Parameters:
    ///   - content: A view builder closure that provides the custom content for the toast.
    @MainActor
    func show<Content: View>(
        @ViewBuilder content: () -> Content
    ) {
        show(
            holdSec: STKDefaults.holdSec,
            animationStyle: STKDefaults.animationStyle,
            alignment: STKDefaults.alignemnt,
            content: content,
        )
    }
}
