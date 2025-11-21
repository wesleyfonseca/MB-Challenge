//
//  MainCoordinator.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import UIKit

final class MainCoordinator: NavigationCoordinator {
    
    private lazy var homeBuilder: HomeBuilder = {
        let homeBuilder = HomeBuilder()
        return homeBuilder
    }()
    
    private let homeDetailBuilder: HomeDetailBuilder = {
        let homeDetailBuilder = HomeDetailBuilder()
        return homeDetailBuilder
    }()
    
    func start() {
        viewController.setViewControllers([homeBuilder.build(routerDelegate: self)], animated: true)
    }
}

// MARK: - HomeRouterDelegate

extension MainCoordinator: HomeRouterDelegate {
    func routeToHomeDetail(id: String) {
        let homeDetailViewController = homeDetailBuilder.build(id: id)
        viewController.pushViewController(homeDetailViewController, animated: true)
    }
}
