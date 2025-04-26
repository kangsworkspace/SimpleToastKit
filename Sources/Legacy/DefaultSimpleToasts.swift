////
////  File.swift
////  SimpleToastKit
////
////  Created by 강건 on 4/20/25.
////
//
//import SwiftUI
//
//public enum DefaultSimpleToasts: SimpleToastType {
//    case simpleText(message: String)
//    case withDeleteButton(message: String)
//    
//    public func makeToastView() -> some View {
//        switch self {
//        case .simpleText(let message):
//            return AnyView(
//                Text(message)
//                    .foregroundStyle(Color.white)
//                    .padding()
//                    .background {
//                        Capsule()
//                            .foregroundStyle(Color.black)
//                    }
//            )
//            
//        case .withDeleteButton(let message):
//            return AnyView(
//                Text(message)
//            )
//        }
//    }
//}
