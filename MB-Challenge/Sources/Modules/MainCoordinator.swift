//
//  MainCoordinator.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import UIKit

final class MainCoordinator: NavigationCoordinator {
    
    private lazy var homeBuilder: UIViewController = {
        let homeBuilder = HomeBuilder()
        return homeBuilder.build(routerDelegate: self)
    }()
    
    func start() {
        viewController.setViewControllers([homeBuilder], animated: true)
    }
}

// MARK: - HomeRouterDelegate

extension MainCoordinator: HomeRouterDelegate {
    func routeToHomeDetail() {
        
    }
}
