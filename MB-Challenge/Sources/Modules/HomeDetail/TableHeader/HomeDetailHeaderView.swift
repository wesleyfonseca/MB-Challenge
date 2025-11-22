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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private let spotVolumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = "Spot Volume"
        return label
    }()
    
    private let spotVolumeLabelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = "Description"
        return label
    }()
    
    private let descriptionLabelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 6
        return label
    }()
    
    private let urlWebsiteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = "Website"
        return label
    }()
    
    private let urlWebsiteLabelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let markerFeeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = "Marker Fee"
        return label
    }()
    
    private let markerFeeLabelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let tankerFeeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = "Tanker Fee"
        return label
    }()
    
    private let tankerFeeLabelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let dateLaunchedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.text = "Date Launched"
        return label
    }()
    
    private let dateLaunchedLabelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
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
        addSubview(titleLabel)
        addSubview(container)
        container.addSubview(stackView)
        stackView.addArrangedSubview(spotVolumeLabel)
        stackView.addArrangedSubview(spotVolumeLabelValue)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(descriptionLabelValue)
        stackView.addArrangedSubview(urlWebsiteLabel)
        stackView.addArrangedSubview(urlWebsiteLabelValue)
        stackView.addArrangedSubview(markerFeeLabel)
        stackView.addArrangedSubview(markerFeeLabelValue)
        stackView.addArrangedSubview(tankerFeeLabel)
        stackView.addArrangedSubview(tankerFeeLabelValue)
        stackView.addArrangedSubview(dateLaunchedLabel)
        stackView.addArrangedSubview(dateLaunchedLabelValue)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            exchangeImage.topAnchor.constraint(equalTo: topAnchor, constant: 48),
            exchangeImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            exchangeImage.heightAnchor.constraint(equalToConstant: 80),
            exchangeImage.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: exchangeImage.bottomAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: exchangeImage.centerXAnchor),
            
            container.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48),
            
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16)
        ])
        
        stackView.setCustomSpacing(24, after: spotVolumeLabelValue)
        stackView.setCustomSpacing(24, after: descriptionLabelValue)
        stackView.setCustomSpacing(24, after: urlWebsiteLabelValue)
        stackView.setCustomSpacing(24, after: markerFeeLabelValue)
        stackView.setCustomSpacing(24, after: tankerFeeLabelValue)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .systemGray6
        container.backgroundColor = .systemGray3
        container.layer.cornerRadius = 12.0
    }
}

// MARK: - Configure

extension HomeDetailHeaderView {
    func configure(dto: HomeDetailHeaderDTO) {
        exchangeImage.downloadImage(with: dto.logo)
        titleLabel.text = dto.title
        spotVolumeLabelValue.text = dto.spotValue
        descriptionLabelValue.text = dto.description
        urlWebsiteLabelValue.text = dto.website
        markerFeeLabelValue.text = dto.markerFee
        tankerFeeLabelValue.text = dto.tankerFee
        dateLaunchedLabelValue.text = dto.dateLaunched
    }
}

