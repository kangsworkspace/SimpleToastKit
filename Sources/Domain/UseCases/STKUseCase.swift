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
    /// A publisher that emits toast activation state for custom toast views.
    ///
    /// Immediately emits `true` to indicate that the toast should appear,
    /// and then emits `false` after the specified `holdSec` duration to indicate that the toast should disappear.
    var toastActivation: AnyPublisher<Bool, Never> { get }
    
    /// A publisher that emits toast activation states for default simple toast views.
    ///
    /// Immediately emits `true` to indicate that the toast should appear,
    /// and then emits `false` after the specified `holdSec` duration to indicate that the toast should disappear.
    var simpleToastActivation: AnyPublisher<Bool, Never> { get }
    
    /// Sets a timer that controls the visibility of a toast view.
    ///
    /// - Parameter holdSec: The number of seconds the toast view remains visible.
    func setToastViewTimer(holdSec: Double)
    
    /// Sets a timer that controls the visibility of a toast view.
    ///
    /// - Parameter holdSec: The number of seconds the toast view remains visible.
    func setSimpleToastViewTimer(holdSec: Double)
}

/// The default implementation of `STKUseCaseProtocol`.
///
/// `STKUseCase` provides the standard behavior for managing
/// toast view visibility based on a timer mechanism.
internal final class STKUseCase: STKUseCaseProtocol {
    
    // MARK: Toast view
    
    private let toastSubject = CurrentValueSubject<Bool, Never>(false)
    private var toastCancellables = Set<AnyCancellable>()

    internal var toastActivation: AnyPublisher<Bool, Never> {
        toastSubject.eraseToAnyPublisher()
    }
    

    // MARK: Simple toast view
    
    private let simpleToastSubject = CurrentValueSubject<Bool, Never>(false)
    private var simpleToastCancellables = Set<AnyCancellable>()

    internal var simpleToastActivation: AnyPublisher<Bool, Never> {
        simpleToastSubject.eraseToAnyPublisher()
    }
    
    
    init() {}
    
    internal func setToastViewTimer(holdSec: Double) {
        let isActive = toastSubject.value
        
        toastCancellables.removeAll()
        
        let toastStream = Just(true)
            .append(
                Just(false)
                    .delay(for: .seconds(holdSec),scheduler: RunLoop.main)
            )
        
        let cancelStream = Just(false)
            .append(
                Just(true)
                    .delay(for: .seconds(0.36),scheduler: RunLoop.main)
            )
        
        let fullStream = isActive
        ? cancelStream.append(toastStream).eraseToAnyPublisher()
        : toastStream.eraseToAnyPublisher()
        
        fullStream
            .sink { [weak self] in
                self?.toastSubject.send($0)
            }
            .store(in: &toastCancellables)
    }
    
    internal func setSimpleToastViewTimer(holdSec: Double) {
        let isActive = simpleToastSubject.value
        
        simpleToastCancellables.removeAll()
        
        let toastStream = Just(true)
            .append(
                Just(false)
                    .delay(for: .seconds(holdSec),scheduler: RunLoop.main)
            )
        
        let cancelStream = Just(false)
            .append(
                Just(true)
                    .delay(for: .seconds(0.36),scheduler: RunLoop.main)
            )
        
        let fullStream = isActive
        ? cancelStream.append(toastStream).eraseToAnyPublisher()
        : toastStream.eraseToAnyPublisher()
        
        fullStream
            .sink { [weak self] in
                self?.simpleToastSubject.send($0)
            }
            .store(in: &toastCancellables)
    }
}
