//
//  AppFeatureTests.swift
//  MyTests
//
//  Created by IK-LPC-084 on 6/7/24.
//

import ComposableArchitecture
import XCTest

@testable import My

@MainActor
final class AppFeatureTests: XCTestCase {

    func testIncrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(\.tab1.decrementButtonTapped)
    }
    
    
    
    

}
