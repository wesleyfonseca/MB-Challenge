//
//  HomeRouterDelegateSpy.swift
//  MB-ChallengeTests
//
//  Created by Wésley Fonseca on 22/11/25.
//

import Foundation
@testable import MB_Challenge

final class HomeRouterDelegateSpy: HomeRouterDelegate {
    
    private(set) var routeToHomeDetailCalled = false
    
    func routeToHomeDetail(exchangeInfoData: HomeExchangeInfoData) {
        routeToHomeDetailCalled = true
    }
}
