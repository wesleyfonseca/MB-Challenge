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
        startLoading()
    }
    
    // MARK: - Methods
    
    private func setupView() {
        view = baseView
        title = "Exchanges"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .black
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
    }
    
    private func startLoading() {
        baseView.startLoading()
    }
}

// MARK: - HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {
    func fetchDataWithSuccess() {
        DispatchQueue.main.async {
            self.baseView.stopLoading()
            self.baseView.tableView.reloadData()
        }
    }
    
    func fetchDataWithError() {
        baseView.stopLoading()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableCell.self),
                                                       for: indexPath) as? HomeTableCell else {
            return UITableViewCell()
        }
        
        guard let dto = viewModel.tableCellDto(row: indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.configure(dto: dto)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(row: indexPath.row)
    }
}
