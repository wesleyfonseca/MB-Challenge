//
//  File.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 17/11/25.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Properties
    
    lazy var tableView: UITableView  = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInsetAdjustmentBehavior = .automatic
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

extension HomeView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupContraints() {
        tableView.pinToBounds(of: self)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
