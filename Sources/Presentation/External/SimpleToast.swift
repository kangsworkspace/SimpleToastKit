//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/29/25.
//

import SwiftUI

/// A structure that contains Data for build SimpleToastView
///
/// Need to return this in a closure when you use `STK.toast.showSimple`
/// You can also customize the toast by chaining modifiers such as `toastAnimation(_:)` and `toastShape(_:)`.
///
/// Example:
/// ```swift
/// SimpleToast(message: "Hello")
///     .toastShape(.roundedRectangle())
///     .toastAnimation(.fade)
/// ```
public struct SimpleToast {
    public var message: String
    public var holdSec: Double
    
    internal var shape: SimpleToastShape = .roundedRectangle()
    internal var animationStyle: STKAnimationStyle = STKDefaults.animationStyle
    
    // Initializer for only set message
    public init(message: String) {
        self.message = message
        self.holdSec = STKDefaults.holdSec
    }
    
    // Initializer fot set message with holdSec
    public init(message: String, holdSec: Double) {
        self.message = message
        self.holdSec = holdSec
    }
}

// MARK: - SimpleToast Modifiers

extension SimpleToast {
    public func toastAnimation(_ animation: STKAnimationStyle) -> SimpleToast {
        var copy = self
        copy.animationStyle = animation
        return copy
    }
    
    public func toastShape(_ shape: SimpleToastShape) -> SimpleToast {
        var copy = self
        copy.shape = shape
        return copy
    }
}
