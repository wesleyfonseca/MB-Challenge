//
//  ViewCodeProtocol.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

protocol ViewCodeProtocol: AnyObject {
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCodeProtocol {
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionalConfiguration()
    }
    
    func buildViewHierarchy() {}
    func setupContraints() {}
    func setupAdditionalConfiguration() {}
}
