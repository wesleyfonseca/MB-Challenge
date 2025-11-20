//
//  Double+Extensions.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 19/11/25.
//

import Foundation

extension Optional where Wrapped == Double {
    func formatToUSD() -> String? {
        guard let value = self else { return nil }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value))
    }
}
