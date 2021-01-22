//
//  HomeSubHeaderView.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/21/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit

class HomeSubHeaderView: UIView {
    
    lazy var posterImageView: UIImageView = UIImageView()
    lazy var stackView: UIStackView = UIStackView()
    lazy var titleLabel: UILabel = UILabel()
    lazy var genreLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setupPosterImageView()
        setupTitleLabel()
        setupGenreLabel()
        setupStackView()
    }
    
    private func setupPosterImageView() {
        posterImageView.image = UIImage(named: "sample.jpeg")
        addSubview(posterImageView)
        posterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(250)
            make.width.equalTo(150)
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.text = "Title • "
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setupGenreLabel() {
        genreLabel.text = "Genre"
        genreLabel.textColor = .white
        genreLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        stackView.addArrangedSubview(genreLabel)
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(5)
            make.centerX.equalTo(posterImageView)
            make.bottom.equalToSuperview().inset(5)
        }
    }
}
