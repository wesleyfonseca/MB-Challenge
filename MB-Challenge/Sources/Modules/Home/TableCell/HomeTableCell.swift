//
//  HomeTableCell.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 19/11/25.
//

import UIKit

final class HomeTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let exchangeImage: DownloaderImageView = {
        let image = DownloaderImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12.0
        return image
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8.0
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCodeProtocol

extension HomeTableCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(container)
        container.addSubview(exchangeImage)
        container.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
    }
    
    func setupContraints() {
        container.pinToBounds(of: contentView, customSpacing: UIEdgeInsets(top: 8,
                                                                           left: 16,
                                                                           bottom: 16,
                                                                           right: 8))
        NSLayoutConstraint.activate([
            exchangeImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            exchangeImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            exchangeImage.widthAnchor.constraint(equalToConstant: 50),
            exchangeImage.heightAnchor.constraint(equalToConstant: 50),
            exchangeImage.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16),
            
            stackView.topAnchor.constraint(equalTo: exchangeImage.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: exchangeImage.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16)
        ])
    }
    
    func setupAdditionalConfiguration() {
        container.backgroundColor = .white
        container.layer.cornerRadius = 12.0
        
        backgroundColor = .clear
        selectionStyle = .none
    }
}

// MARK: - Configure

extension HomeTableCell {
    func configure(dto: HomeTableCellDTO) {
        exchangeImage.downloadImage(with: dto.logo)
        titleLabel.text = dto.title
    }
}
