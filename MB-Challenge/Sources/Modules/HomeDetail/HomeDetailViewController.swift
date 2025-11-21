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
        startLoading()
    }
    
    // MARK: - Methods
    
    private func setupView() {
        view = baseView
        
        baseView.tableView.delegate = self
        baseView.tableView.dataSource = self
    }
    
    private func startLoading() {
        baseView.startLoading()
    }
}

// MARK: - HomeDetailViewModelDelegate

extension HomeDetailViewController: HomeDetailViewModelDelegate {
    func fetchDataWithSuccess() {
        DispatchQueue.main.async {
            guard let headerDTO = self.viewModel.headerDTO else { return }
            self.baseView.stopLoading()
            
            let header = self.baseView.headerView
            header.configure(dto: headerDTO)
            let height = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            header.frame.size.height = height
            
            self.baseView.tableView.tableHeaderView = header
            self.baseView.tableView.reloadData()
        }
    }
    
    func fetchDataWithError() {
        baseView.stopLoading()
        print("ERROR DETAIL")
    }
}


// MARK: - UITableViewDelegate & UITableViewDataSource

extension HomeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
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
