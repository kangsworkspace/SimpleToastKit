////
////  File.swift
////  SimpleToastKit
////
////  Created by 강건 on 4/20/25.
////

import SwiftUI
import Combine

/// The internal view model that manages toast presentation state and user interactions.
///
/// `STKViewModel` acts as the central coordinator in SimpleToastKit, handling
/// user-triggered actions via `STKTrigger` and exposing toast state via `STKStateProvider`.
///
/// - Note:
///   This class is internal and not intended for direct use by external users.
internal final class STKViewModel: ObservableObject {
    /// The shared singleton instance for managing the toast system.
    @MainActor static let shared = STKViewModel(usecase: STKUseCase())
    
    /// The current state of the toast view.
    @Published private var state: State = State()
    
    private let usecase: STKUseCaseProtocol
    private var cancellables: Set<AnyCancellable> = []
    private init(usecase: STKUseCaseProtocol) { self.usecase = usecase }
}


// MARK: MVI Patthern - State & Intent & send()

extension STKViewModel {
    /// A structure that represents the state of the toast view.
    struct State {
        /// Indicates whether the custom toast view is currently active (visible).
        var isToastActive: Bool = false
        
        /// Indicates whether the toast view is currently active (visible).
        var isSimpleToastActive: Bool = false
        
        /// A Structure that contains Data for build SimpleToastView
        var simpleToast: SimpleToast = SimpleToast(message: "Default")
        
        /// The custom content displayed in the toast view.
        var toastContent: AnyView = AnyView(EmptyView())
        
        /// The animation style applied to the toast's presentation and dismissal.
        var animationStyle: STKAnimationStyle = STKAnimationStyle.fade
    }
    
    /// An enumeration representing user intents that affect the toast view.
    ///
    /// Defines the various actions that can be performed related to the toast system.
    private enum Intent {
        /// Intent to activate a toast view with the given associated values.
        case activateToastView(ToastViewData)
        case activateSimpleToastView(SimpleToast)
    }
    
    /// Sends an intent to the view model for processing.
    ///
    /// - Parameter intent: The intent representing a user.
    @MainActor
    private func send(_ intent: Intent) async {
        switch intent {
        case .activateToastView(let toastViewData):
            handleActivateToastView(toastViewData)
        case .activateSimpleToastView(let simpleToastData):
            handleActiveSimpleToastView(simpleToastData)
        }
    }
}


// MARK: Handle intent

extension STKViewModel {
    /// Handles the activation of a toast view based on the provided data.
    ///
    /// Updates the toast's content, animation style, and visibility state according to the specified configuration.
    ///
    /// - Parameter toastViewData: The data describing the toast's appearance and behavior.
    func handleActivateToastView(_ toastViewData: ToastViewData) {
        usecase.setToastViewTimer(holdSec: toastViewData.holdSec)
            .receive(on: RunLoop.main)
            .sink { [weak self] toastActiveState in
                self?.state.toastContent = AnyView(toastViewData.content)
                self?.state.animationStyle = toastViewData.animationStyle
                
                withAnimation(toastViewData.animationStyle.animation) {
                    self?.state.isToastActive = toastActiveState
                }
            }
            .store(in: &cancellables)
    }
    
    func handleActiveSimpleToastView(_ simpleToast: SimpleToast) {
        usecase.setSimpleToastViewTimer(holdSec: simpleToast.holdSec)
            .receive(on: RunLoop.main)
            .sink { [weak self] simpleToastActiveState in
                self?.state.simpleToast = simpleToast
                self?.state.animationStyle = simpleToast.animationStyle
                
                withAnimation(simpleToast.animationStyle.animation) {
                    self?.state.isSimpleToastActive = simpleToastActiveState
                }
            }
            .store(in: &cancellables)
    }
}


// MARK: STKStateProvider - Provides State to modifier

extension STKViewModel: STKStateProvider {
    public var isToastActive: Bool { state.isToastActive }
    public var isSimpeToastActive: Bool { state.isSimpleToastActive }
    public var simpleToast: SimpleToast { state.simpleToast }
    public var toastContent: AnyView { state.toastContent }
    public var animationStyle: STKAnimationStyle { state.animationStyle }
}


// MARK: STKTrigger - Accept user action

extension STKViewModel: STKTrigger {
    public func show<Content: View>(
        holdSec: Double = STKDefaults.holdSec,
        animationStyle: STKAnimationStyle = STKDefaults.animationStyle,
        @ViewBuilder content: () -> Content
    ) {
        let anyView = AnyView(content())
        
        Task {
            await send(
                .activateToastView(
                    ToastViewData(
                        holdSec: holdSec,
                        animationStyle: animationStyle,
                        content: anyView
                    )
                )
            )
        }
    }
    
    public func showSimple(
        simpleToast: () -> SimpleToast
    ) {
        let simpleToast = simpleToast()
        
        Task {
            await send(
                .activateSimpleToastView(
                    simpleToast
                )
            )
        }
    }
}
