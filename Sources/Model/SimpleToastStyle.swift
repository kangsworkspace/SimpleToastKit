////
////  File.swift
////  SimpleToastKit
////
////  Created by 강건 on 4/20/25.
////
//
//import SwiftUI
//
///// ToastStyle
//public protocol SimpleToastStyle {
//    /// color of message
//    var messageColor: Color { get }
//    /// font of message
//    var font: Font { get }
//    /// color of background shape
//    var backgroundColor: Color { get }
//    /// corneradius value of shape
//    /// does'nt apply when shape is capsule
//    var cornerRadius: CGFloat { get }
//    /// shape of background thing
//    var shape: SimpleToastShape { get }
//    /// padding of text to shape space
//    var inlinePadding: CGFloat { get }
//}
//
///// Default Values
//public extension SimpleToastStyle {
//    var messageColor: Color { .white }
//    var font: Font { .body }
//    var backgroundColor: Color { .black }
//    var cornerRadius: CGFloat { 8 }
//    var shape: SimpleToastShape { .roundedRectangle }
//    var inlinePadding: CGFloat { 12 }
//}
//
//public struct DefaultSimpleToastStlye: SimpleToastStyle { public init(){} }
