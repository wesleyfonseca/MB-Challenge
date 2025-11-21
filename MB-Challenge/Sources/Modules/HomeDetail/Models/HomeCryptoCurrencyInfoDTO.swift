//
//  HomeCryptoCurrencyInfoDTO.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import Foundation

struct HomeCryptoCurrencyInfoDTO: Codable {
    let data: [String: HomeCryptoCurrencyInfoData]
}

struct HomeCryptoCurrencyInfoData: Codable {
    let id: Int?
    let logo: String?
}
