//
//  HomeExchangeMapDTO.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

struct HomeExchangeMapDTO: Codable {
    let data: [HomeExchangeMapData]
}

struct HomeExchangeMapData: Codable {
    let id: Int
}
