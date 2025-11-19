//
//  HomeExchangeInfoEndpoint.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 19/11/25.
//

import Foundation

final class HomeExchangeInfoEndpoint: NetworkEndpoint {
    
    // MARK: - Properties
    
    var baseURL: URL {
        return networkConfiguration.environment.domainURL
    }
    
    var path: String {
        return "/v1/exchange/info"
    }
    
    var method: NetworkMethod {
        return .get
    }
    
    var task: NetworkTask {
        return .requestParameters(parameters: ["id": ids.compactMap({$0}).joined(separator: ",")])
    }
    
    var headers: [String : String] {
        return networkConfiguration.defaultHeaders()
    }
    
    private let networkConfiguration: NetworkConfiguration
    private let ids: [String]
    
    // MARK: - Init
    
    init(networkConfiguration: NetworkConfiguration = NetworkConfiguration(),
         ids: [String]) {
        self.networkConfiguration = networkConfiguration
        self.ids = ids
    }
}
