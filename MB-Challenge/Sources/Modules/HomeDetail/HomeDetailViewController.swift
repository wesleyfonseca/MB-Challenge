//
//  HomeDetailViewController.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import UIKit

final class HomeDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: HomeDetailViewModelProtocol
    private let baseView = HomeDetailView()
    
    // MARK: - Init
    
    init(viewModel: HomeDetailViewModelProtocol) {
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
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
    }
}

// MARK: - HomeDetailViewModelDelegate

extension HomeDetailViewController: HomeDetailViewModelDelegate {
    func fetchDataWithSuccess() {
        DispatchQueue.main.async {
            self.baseView.tableView.reloadData()
        }
    }
    
    func fetchDataWithError() {
        print("ERROR DETAIL")
    }
}


// MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numberOfRows
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableCell.self),
//                                                       for: indexPath) as? HomeTableCell else {
            return UITableViewCell()
//        }
//        
//        guard let dto = viewModel.tableCellDto(row: indexPath.row) else {
//            return UITableViewCell()
//        }
//        
//        cell.configure(dto: dto)
//        return cell
    }
}
