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
        setupView()
        viewModel.fetchData()
    }
    
    // MARK: - Methods
    
    private func setupView() {
        view = baseView
        title = "Exchanges"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
    }
}

// MARK: - HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {
    func fetchDataWithSuccess() {
        DispatchQueue.main.async {
            self.baseView.tableView.reloadData()
        }
    }
    
    func fetchDataWithError() {
        print("ERROR")
    }
}


// MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test \(indexPath.row)"
        
        return cell
    }
}
