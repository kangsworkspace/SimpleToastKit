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
    @MainActor static let shared = STKViewModel()
    
    /// The current state of the toast view.
    @Published private var state: State = State()
    
    private var usecase: STKUseCaseProtocol = STKUseCase()
    private var cancellables: Set<AnyCancellable> = []
    
    #if DEBUG
    /// Inject `STKUseCaseProtocol` type Usecase
    ///
    /// > Warning:
    ///   This function is only for testing purpose.
    ///   Do not use this for release code.
    internal func injectUsecase(_ usecase: STKUseCaseProtocol) {
        self.usecase = usecase
        
        cancellables.removeAll()
        subscribeUsecase()
    }
    #endif
    
    private init() {subscribeUsecase() }
    
    func subscribeUsecase() {
        usecase.toastActivation
            .receive(on: RunLoop.main)
            .sink { [weak self] isActive in
                guard let self else { return }
                
                withAnimation(self.state.animationStyle.animation) {
                    self.state.isToastActive = isActive
                }
            }
            .store(in: &cancellables)
        
        usecase.simpleToastActivation
            .receive(on: RunLoop.main)
            .sink { [weak self] isActive in
                guard let self else { return }
                
                withAnimation(self.state.animationStyle.animation) {
                    self.state.isSimpleToastActive = isActive
                }
            }
            .store(in: &cancellables)
    }
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
        
        /// The position where the toast view will appear.
        var alignment: STKAlignment = .bottom
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
        state.toastContent = AnyView(toastViewData.content)
        state.animationStyle = toastViewData.animationStyle
        state.alignment = toastViewData.alignment
        
        usecase.setToastViewTimer(holdSec: toastViewData.holdSec)
    }
    
    func handleActiveSimpleToastView(_ simpleToast: SimpleToast) {
        state.simpleToast = simpleToast
        state.animationStyle = simpleToast.animationStyle
        state.alignment = simpleToast.alignment
        
        usecase.setSimpleToastViewTimer(holdSec: simpleToast.holdSec)
    }
}


// MARK: STKStateProvider - Provides State to modifier

extension STKViewModel: STKStateProvider {
    public var isToastActive: Bool { state.isToastActive }
    public var isSimpeToastActive: Bool { state.isSimpleToastActive }
    public var simpleToast: SimpleToast { state.simpleToast }
    public var toastContent: AnyView { state.toastContent }
    public var animationStyle: STKAnimationStyle { state.animationStyle }
    public var alignment: STKAlignment { state.alignment }
}


// MARK: STKTrigger - Accept user action

extension STKViewModel: STKTriggerProtocol {
    public func show<Content: View>(
        holdSec: Double,
        animationStyle: STKAnimationStyle,
        alignment: STKAlignment,
        @ViewBuilder content: () -> Content
    ) {
        let anyView = AnyView(content())
        
        Task {
            await send(
                .activateToastView(
                    ToastViewData(
                        holdSec: holdSec,
                        animationStyle: animationStyle,
                        content: anyView,
                        alignment: alignment
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
