//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 6/1/25.
//

import SwiftUI

/// The main entry point for using SimpleToastKit.
///
/// `STK` provides access to the core functionalities of the library,
/// exposing public and internal interfaces to interact with the toast system.
public final class STK: STKTriggerProtocol {
    @MainActor private let viewModel = STKViewModel.shared

    /// Public singleton instance to activate `STKViewModel.STKTriggerProtocol`
    public static let toast = STK()
    private init() {}
    
    public func show<Content>(
        holdSec: Double,
        animationStyle: STKAnimationStyle,
        alignment: STKAlignment,
        content: () -> Content
    ) where Content : View {
        viewModel
            .show(
                holdSec: holdSec,
                animationStyle: animationStyle,
                alignment: alignment,
                content: content
            )
    }
    
    public func showSimple(
        simpleToast: () -> SimpleToast
    ) {
        viewModel
            .showSimple(
                simpleToast: simpleToast
            )
    }
}
