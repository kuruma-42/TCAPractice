//
//  MyApp.swift
//  My
//
//  Created by IK-LPC-084 on 6/4/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct MyApp: App {
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
            ._printChanges()
    }
    var body: some Scene {
        WindowGroup {
            AppView(store: MyApp.store)
        }
    }
}
