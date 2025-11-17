//
//  NetworkConfiguration.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

final class NetworkConfiguration {
    
    func defaultHeaders() -> [String: String] {
        let headers = [
            "Plataform": "iOS",
            "Content-Type": "Application/json"
        ]
        return headers
    }
}
