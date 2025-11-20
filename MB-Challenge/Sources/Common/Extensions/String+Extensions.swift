//
//  String+Extensions.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 19/11/25.
//

import Foundation

extension String {
    func convertToMMDDYYYY() -> String {
        let inputFormatter = ISO8601DateFormatter()
        inputFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MM/dd/yyyy"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.timeZone = .current

        if let date = inputFormatter.date(from: self) {
            return outputFormatter.string(from: date)
        }
        
        return self
    }
}
