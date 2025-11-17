//
//  MainCoordinator.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import UIKit

final class MainCoordinator: NavigationCoordinator {
    
    private let homeBuilder: UIViewController = {
        let homeBuilder = HomeViewController()
        return homeBuilder
    }()
    
    func start() {
        viewController.setViewControllers([homeBuilder], animated: true)
    }
}
