////
////  File.swift
////  SimpleToastKit
////
////  Created by 강건 on 4/25/25.
////

import SwiftUI
import Combine

/// A protocol that defines the use cases provided by the SimpleToastKit library.
///
/// `STKUseCaseProtocol` encapsulates the actions that control the toast view's appearance and behavior.
/// This protocol is intended for internal use and coordination within the library.
///
/// > Note:
///   This protocol is not intended to be implemented or used directly by external users.
///   It defines the standard flow of toast presentation logic internally.
internal protocol STKUseCaseProtocol {
    /// Sets a timer that controls the visibility of a toast view.
    ///
    /// Immediately return `true` to indicate that the toast should appear,
    /// and then return `false` after the specified `holdSec` duration to indicate that the toast should disappear.
    ///
    /// - Parameter holdSec: The number of seconds the toast view remains visible.
    /// - Returns:
    ///   An `AnyPublisher<Bool, Never>` that return the toast view's active state changes.
    func setToastViewTimer(holdSec: Double) -> AnyPublisher<Bool, Never>
}

/// The default implementation of `STKUseCaseProtocol`.
///
/// `STKUseCase` provides the standard behavior for managing
/// toast view visibility based on a timer mechanism.
internal struct STKUseCase: STKUseCaseProtocol {
    internal func setToastViewTimer(holdSec: Double) -> AnyPublisher<Bool, Never> {
        Just(true)
            .append(
                Just(false)
                    .delay(for: .seconds(holdSec), scheduler: RunLoop.main)
            )
            .eraseToAnyPublisher()
    }
}
