//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import SwiftUI

public extension View {
    /// Apply `STKModifier`  to the view .
    ///
    /// This function apply `STKModifier`  to the view .
    ///
    /// ```swift
    /// Struct SomeViewToToast: View {
    ///     var body: some View {
    ///         Vstack {
    ///
    ///         }
    ///     }
    ///     .toastable()
    /// }
    /// ```
    /// > Warning: The `toastable()` modifier should be attached to the topmost view in the hierarchy.
    /// Otherwise, it may cause unexpected behavior or conflicts.
    /// - Returns: Returns A view modified with `ToastViewModifier`
    func toastable() -> some View {
        self.modifier(STKModifier(toastState: STK.internalShared))
    }
}
