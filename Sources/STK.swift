//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import Foundation
import SwiftUI

@MainActor
final class STK: ObservableObject {
    static let shared = STK()
    private init(){}
    
    @Published var isPresented: Bool = false
    @Published var toastContent: AnyView = AnyView(EmptyView())
    
    func showToastView(holdSec: Double = 2.0, @ViewBuilder content: @escaping () -> some View) {
        toastContent = AnyView(content())
        isPresented = true

        Task {
            try? await Task.sleep(nanoseconds: UInt64(holdSec * 1_000_000_000))
            isPresented = false
        }
    }
}
