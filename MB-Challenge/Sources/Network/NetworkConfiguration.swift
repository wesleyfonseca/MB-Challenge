//
//  NetworkConfiguration.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

final class NetworkConfiguration {
    
    // MARK: - Properties
    
    let environment = Environment()
    
    // MARK: - Methods
    
    func defaultHeaders() -> [String: String] {
        let headers = [
            "Plataform": "iOS",
            "Content-Type": "Application/json",
            "X-CMC_PRO_API_KEY": "480f926086b542789a4eaaa32113e148"
        ]
        return headers
    }
}
