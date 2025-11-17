//
//  Coordinatable.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import UIKit

protocol Coordinatable: AnyObject {
    var rootViewController: UIViewController { get }
    
    func start()
}
