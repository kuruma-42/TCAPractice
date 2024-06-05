//
//  AppView.swift
//  My
//
//  Created by IK-LPC-084 on 6/5/24.
//

import ComposableArchitecture
import Foundation
import SwiftUI

struct AppView: View {
    let store1: StoreOf<CounterFeature>
    let store2: StoreOf<CounterFeature>
    
    var body: some View {
        TabView {
            CounterView(store: store1)
                .tabItem {
                    Text("Counter 1")
                }
            
            CounterView(store: store2)
                .tabItem {
                    Text("Counter 2")
                }
        }
    }
}

