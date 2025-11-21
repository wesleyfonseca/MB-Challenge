//
//  HomeDetailView.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import UIKit

final class HomeDetailView: UIView {
    
    // MARK: - Properties
    
    lazy var tableView: UITableView  = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInsetAdjustmentBehavior = .automatic
//        tableView.register(HomeTableCell.self, forCellReuseIdentifier: String(describing: HomeTableCell.self))
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodeProtocol

extension HomeDetailView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupContraints() {
        tableView.pinToBounds(of: self)
    }
    
    func setupAdditionalConfiguration() {
        tableView.backgroundColor = .systemGray6
    }
}

