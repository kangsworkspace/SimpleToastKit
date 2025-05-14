//
//  ToastViewData.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/26/25.
//
import SwiftUI


/// A data container used internally to manage toast presentation parameters.
///
/// `ToastViewData` encapsulates the necessary information for displaying a custom toast view,
/// including the display duration, animation style, animation option, and the content to be shown.
///
/// > Note:
///   This structure is intended for internal use only.
///   It is used within the `STKViewModel` to simplify managing toast view states,
///   and is not exposed for public API usage.
internal struct ToastViewData {
    /// The duration in seconds for which the toast view remains visible.
    let holdSec: Double
    /// The animation style applied when presenting and dismissing the toast view.
    let animationStyle: STKAnimationStyle
    /// The custom view content displayed inside the toast view.
    ///
    /// This content is provided as an 'AnyView' to allow flexible customization internally
    let content: AnyView
    /// The position where the toast view will appear.
    let alignment: STKAlignment
}
