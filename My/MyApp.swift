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
    var body: some Scene {
        WindowGroup {
            CounterView(
                store: Store(initialState: CounterFeature.State(), reducer: {
                    CounterFeature()
                })
            )
        }
    }
}
