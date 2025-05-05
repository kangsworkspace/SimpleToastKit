////
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/25/25.
//

import SwiftUI

/// Makes the view toastable.
///
/// This modifier enables the view to display toast view using the `STK` class,
/// and applies toast animation effects.
/// > Important: You must make the view toastable to use `SimpleToastKit`.
/// - Returns: Returns A view modified with `ToastViewModifier`
internal struct STKModifier<ToastState: STKStateProvider>: ViewModifier {
    @ObservedObject var toastState: ToastState
    @State private var textHeight: CGFloat = 0
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            if toastState.isToastActive {
                VStack {
                    Spacer()
                    
                    toastState.toastContent
                }
                .transition(toastState.animationStyle.transition)
            }
            
            if toastState.isSimpeToastActive {
                VStack {
                    Spacer()
                    
                    simpleToastBuilder(simpleToast: toastState.simpleToast)
                }
                .transition(toastState.animationStyle.transition)
            }
        }
    }
    
    /// Build the `toast view` based on the shape of the given ``SimpleToast``.
    /// - Parameter simpleToast: A ``SimpleToast`` instance provided by the user.
    @ViewBuilder
    private func simpleToastBuilder(simpleToast: SimpleToast) -> some View {
        switch simpleToast.shape {
        case .roundedRectangle:
            buildRoundedRectangle(simpleToast: simpleToast)
        }
    }
    
    
    /// Build `RoundedRectangle` shaped `toast view`
    /// - Parameter simpleToast: A ``SimpleToast`` instance provided by the user.
    @ViewBuilder
    private func buildRoundedRectangle(simpleToast: SimpleToast) -> some View {
        if case let .roundedRectangle(
            alignment,
            messageColor,
            messageFont,
            title,
            titleFont,
            titleColor,
            leadingImage,
            trailingImage,
            backgroundColor,
            cornerRadius,
            insetVerticalPadding,
            insetHorizontalPadding
        ) = simpleToast.shape {
            VStack(alignment: alignment) {
                if let title {
                    Text(title)
                        .foregroundStyle(titleColor)
                        .font(titleFont)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                }
                
                HStack {
                    if let leadingImage {
                        leadingImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: textHeight, height: textHeight)
                    }
                    
                    Text(simpleToast.message)
                        .foregroundStyle(messageColor)
                        .font(messageFont)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                        .background {
                            GeometryReader { geometry in
                                Color.clear
                                    .onAppear {
                                        textHeight = geometry.size.height
                                    }
                            }
                        }
                    
                    if let trailingImage {
                        trailingImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: textHeight, height: textHeight)
                    }
                }
            }
            .padding(.vertical, insetVerticalPadding)
            .padding(.horizontal, insetHorizontalPadding)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(backgroundColor)
            }
            .fixedSize()
        } else {
            EmptyView()
        }
    }
}

