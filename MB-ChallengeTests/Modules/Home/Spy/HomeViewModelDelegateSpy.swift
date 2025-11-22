//
//  HomeViewModelDelegateSpy.swift
//  MB-ChallengeTests
//
//  Created by Wésley Fonseca on 22/11/25.
//

import Foundation
@testable import MB_Challenge

final class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    
    // MARK: - Properties
    
    private(set) var fetchDataWithSuccessCalled = false
    private(set) var fetchDataWithErrorCalled = false
    
    // MARK: - Methods
    
    func fetchDataWithSuccess() {
        fetchDataWithSuccessCalled = true
    }
    
    func fetchDataWithError() {
        fetchDataWithErrorCalled = true
    }
}
