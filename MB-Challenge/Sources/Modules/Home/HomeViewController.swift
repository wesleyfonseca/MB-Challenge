//
//  HomeViewController.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: HomeViewModelProtocol
    private let baseView = HomeView()
    
    // MARK: - Init
    
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        setupView()
    }
    
    // MARK: - Methods
    
    private func setupView() {
        view = baseView
    }
}

// MARK: - HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {
    func fetchDataWithSuccess() {
        print("SUCCESS")
    }
    
    func fetchDataWithError() {
        print("ERROR")
    }
}
