//
//  HomeEndpoint.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

final class HomeExchangeMapEndpoint: NetworkEndpoint {
    
    // MARK: - Properties
    
    var baseURL: URL {
        return networkConfiguration.environment.domainURL
    }
    
    var path: String {
        return "/v1/exchange/map"
    }
    
    var method: NetworkMethod {
        return .get
    }
    
    var headers: [String : String] {
        return networkConfiguration.defaultHeaders()
    }
    
    private let networkConfiguration: NetworkConfiguration
    private let limit: String
    
    // MARK: - Init
    
    init(networkConfiguration: NetworkConfiguration = NetworkConfiguration(),
         limit: String = "100") {
        self.networkConfiguration = networkConfiguration
        self.limit = limit
    }
}
