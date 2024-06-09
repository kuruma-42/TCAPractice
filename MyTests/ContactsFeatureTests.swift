//
//  ContactsFeatureTests.swift
//  MyTests
//
//  Created by IK-LPC-084 on 6/10/24.
//
import ComposableArchitecture
import XCTest

@testable import My

final class ContactsFeatureTests: XCTestCase {
    let store = TestStore(initialState: ContactsFeature.State()) {
        ContactsFeature
    }
    
}
