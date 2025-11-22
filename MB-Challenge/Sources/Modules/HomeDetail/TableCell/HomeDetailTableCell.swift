//
//  HomeDetailTableCell.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import UIKit

final class HomeDetailTableCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cryptoImage: DownloaderImageView = {
        let image = DownloaderImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8.0
        return image
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 4.0
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
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

extension HomeDetailTableCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(container)
        container.addSubview(cryptoImage)
        container.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    func setupContraints() {
        container.pinToBounds(of: contentView, customSpacing: UIEdgeInsets(top: 8,
                                                                           left: 16,
                                                                           bottom: 8,
                                                                           right: 16))
        NSLayoutConstraint.activate([
            cryptoImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            cryptoImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            cryptoImage.widthAnchor.constraint(equalToConstant: 24),
            cryptoImage.heightAnchor.constraint(equalToConstant: 24),
            
            stackView.topAnchor.constraint(equalTo: cryptoImage.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: cryptoImage.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
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

extension HomeDetailTableCell {
    func configure(dto: HomeDetailTableCellDTO) {
        cryptoImage.downloadImage(with: dto.logo)
        titleLabel.text = dto.title
        subtitleLabel.text = dto.subtitle
    }
}
