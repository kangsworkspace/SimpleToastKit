//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/25/25.
//

import SwiftUI

/// An internal protocol that exposes read-only toast UI states for view modifiers.
///
/// `STKStateProvider` allows SwiftUI view modifiers or views to observe
/// the current toast presentation status, content, and animation style,
/// without directly mutating the underlying state.
///
/// > Note:
///   This protocol is intended for internal use only and should not be accessed by external users.
internal protocol STKStateProvider: ObservableObject {
    
    // MARK: Custom Toast View
    
    /// A Boolean value that indicates whether the custom toast view is currently active (visible).
    var isToastActive: Bool { get }
    
    /// The custom view content currently displayed in the toast.
    var toastContent: AnyView { get }
    
    
    // MARK: Simple Toast View
    
    /// A Boolean value that indicates whether the toast view is currently active (visible).
    var isSimpeToastActive: Bool { get }
    
    /// A Structure that contains Data for build SimpleToastView
    var simpleToast: SimpleToast { get }
    
    
    // MARK: Common
    
    /// The animation style applied to the toast's appearance and disappearance.
    var animationStyle: STKAnimationStyle { get }
}
