//
//  File.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/20/25.
//

import SwiftUI

extension View {
    func toastable() -> some View {
        self.modifier(ToastViewModifier())
    }
}
