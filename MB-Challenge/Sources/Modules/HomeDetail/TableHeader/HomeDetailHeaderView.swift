//
//  HomeDetailHeaderView.swift
//  MB-Challenge
//
//  Created by Wésley Fonseca on 21/11/25.
//

import UIKit

final class HomeDetailHeaderView: UIView {
    
    // MARK: - Properties
    
    private let exchangeImage: DownloaderImageView = {
        let image = DownloaderImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 40.0
        return image
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

extension HomeDetailHeaderView: ViewCodeProtocol {
    func buildViewHierarchy() {
        addSubview(exchangeImage)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            exchangeImage.topAnchor.constraint(equalTo: topAnchor),
            exchangeImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            exchangeImage.heightAnchor.constraint(equalToConstant: 80),
            exchangeImage.widthAnchor.constraint(equalToConstant: 80),
            exchangeImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48)
            
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .systemGray6
    }
}

// MARK: - Configure

extension HomeDetailHeaderView {
    func configure(dto: HomeDetailHeaderDTO) {
        exchangeImage.downloadImage(with: dto.logo)
    }
}

