//
//  NavigationCoordinator.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import UIKit

class NavigationCoordinator: Coordinatable {
    var viewController = UINavigationController()
}

extension Coordinatable where Self: NavigationCoordinator {
    var rootViewController: UIViewController {
        return viewController
    }
    
    func start() {
        fatalError("Implement in child")
    }
}
