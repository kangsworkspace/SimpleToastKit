//
//  STK.swift
//  SimpleToastKit
//
//  Created by 강건 on 4/26/25.
//
import Foundation



/// The main entry point for using SimpleToastKit.
///
/// `STK` provides access to the core functionalities of the library,
/// exposing public and internal interfaces to interact with the toast system.
public enum STK {
    /// The public singleton instance for interacting with the toast system.
    ///
    /// External users can use this interface to trigger toast presentations.
    ///
    /// > Note:
    ///   This property exposes the `STKTrigger` protocol, ensuring
    ///   a stable and safe interface for public use.
    @MainActor
    public static let toast: some STKTrigger = STKViewModel.shared
    
    /// The internal singleton instance for view-to-viewmodel communication.
    ///
    /// This property is intended for internal use only and exposes the
    /// `STKStateProvider` protocol to enable state reading without direct mutation.
    @MainActor
    internal static let internalShared: some STKStateProvider = STKViewModel.shared
}
