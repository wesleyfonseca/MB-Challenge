//
//  HomeDetailView.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import UIKit

final class HomeDetailView: UIView {
    
    // MARK: - Properties
    
    let headerView = HomeDetailHeaderView()
    
    lazy var tableView: UITableView  = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInsetAdjustmentBehavior = .automatic
//        tableView.register(HomeTableCell.self, forCellReuseIdentifier: String(describing: HomeTableCell.self))
        return tableView
    }()
    
    let spinnerView: SpinnerView = {
        let spinner = SpinnerView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    let errorView = ErrorView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func startLoading() {
        tableView.isHidden = true
        spinnerView.startLoading()
    }
    
    func stopLoading() {
        tableView.isHidden = false
        spinnerView.stopLoading()
    }
    
    func showError() {
        stopLoading()
        tableView.isHidden = true
        errorView.isHidden = false
    }
}

// MARK: - ViewCodeProtocol

extension HomeDetailView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(errorView)
        addSubview(spinnerView)
        addSubview(tableView)
    }
    
    func setupContraints() {
        tableView.pinToBounds(of: self)
        errorView.pinToBounds(of: self)
        
        NSLayoutConstraint.activate([
            spinnerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .systemGray6
        tableView.backgroundColor = .systemGray6
    }
}

