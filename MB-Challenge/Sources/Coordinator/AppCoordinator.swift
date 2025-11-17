//
//  AppCoordinator.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import Foundation

final class AppCoordinator: Coordinator {
    
    private let mainCoordinator: MainCoordinator = {
        let coordinator = MainCoordinator()
        return coordinator
    }()
    
    override init() {
        super.init()
        viewController = mainCoordinator.rootViewController
    }
    
    func start() {
        mainCoordinator.start()
    }
}
