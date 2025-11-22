//
//  HomeViewControllerSnapshot.swift
//  MB-ChallengeTests
//
//  Created by Wésley Fonseca on 22/11/25.
//

import Foundation
import SnapshotTesting
import XCTest
@testable import MB_Challenge

final class HomeViewControllerSnapshot: XCTestCase {
 
    private var sut: HomeViewController!
    private var viewModelSpy: HomeViewModelProtocolSpy!
    
    override func setUp() {
        super.setUp()
        
        viewModelSpy = HomeViewModelProtocolSpy()
        sut = HomeViewController(viewModel: viewModelSpy)
    }
    
    override func tearDown() {
        super.tearDown()
        viewModelSpy = nil
        sut = nil
    }
    
    // MARK: - Tests
    
    func testVieDidLoadShouldRenderCorrectly() {
        sut.viewDidLoad()
        sut.fetchDataWithSuccess()
        RunLoop.main.run(until: Date().addingTimeInterval(0.01))
        sut.view.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        sut.view.setNeedsLayout()
        sut.view.layoutIfNeeded()
        
        assertSnapshots(of: sut, as: [.image])
    }
}
