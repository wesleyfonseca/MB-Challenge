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
}

// MARK: - ViewCodeProtocol

extension HomeDetailView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(tableView)
        addSubview(spinnerView)
    }
    
    func setupContraints() {
        tableView.pinToBounds(of: self)
        
        NSLayoutConstraint.activate([
            spinnerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinnerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        tableView.backgroundColor = .systemGray6
    }
}

