//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import SwiftUI



/// The enum that provide options that can modify `SimpleToast`.
public enum SimpleToastShape {
    /// The basic shpae of  `SimpleToast`.
    /// All associated values are optional due to default values.
    case roundedRectangle(
        /// The text alignment, including both the title and message.
        alignment: HorizontalAlignment = .center,
        /// The text color of message.
        messageColor: Color = Color.white.opacity(0.9),
        /// The text font of message
        messageFont: Font = Font.body,
        
        /// The title text
        title: String? = nil,
        /// The text font of title
        titleFont: Font = Font.title3,
        /// The text color of title
        titleColor: Color = Color.yellow.opacity(0.9),

        /// The Image placed at left
        leadingImage: Image? = nil,
        
        /// The Image placed at right
        trailingImage: Image? = nil,
        
        /// The color of rounded rectangle's background
        backgroundColor: Color = Color.black,
        /// The cornerRadius value of rounded rectangle
        cornerRadius: CGFloat = 12,
        
        /// The vertical inset padding from text to rounded rectangle
        insetVerticalPadding: CGFloat = 10,
        /// The horizontal inset padding from text to rounded rectangle
        insetHorizontalPadding: CGFloat = 14
    )
    
    // case capsule
}
