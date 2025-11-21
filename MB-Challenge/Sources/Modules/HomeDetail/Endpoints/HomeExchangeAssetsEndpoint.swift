//
//  HomeExchangeAssetsEndpoint.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 19/11/25.
//

import Foundation

final class HomeExchangeAssetsEndpoint: NetworkEndpoint {
    
    // MARK: - Properties
    
    var baseURL: URL {
        return networkConfiguration.environment.domainURL
    }
    
    var path: String {
        return "/v1/exchange/assets"
    }
    
    var method: NetworkMethod {
        return .get
    }
    
    var task: NetworkTask {
        return .requestParameters(parameters: ["id": id])
    }
    
    var headers: [String : String] {
        return networkConfiguration.defaultHeaders()
    }
    
    private let networkConfiguration: NetworkConfiguration
    private let id: String
    
    // MARK: - Init
    
    init(networkConfiguration: NetworkConfiguration = NetworkConfiguration(),
         id: String) {
        self.networkConfiguration = networkConfiguration
        self.id = id
    }
}
