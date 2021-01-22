//
//  HomeHeaderView.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 1/20/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit
import iOSDropDown
import SnapKit

class HomeHeaderView: UIView {

    lazy var logoImageView: UIImageView = UIImageView()
    lazy var moviesTextFieldDropDown: DropDown = DropDown()
    lazy var tvShowsTextFieldDropDown: DropDown = DropDown()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupView() {
        setupLogoImageView()
        setupMoviesTextFieldDropDown()
        setupTvShowsTextFieldDropDown()
    }
    
    private func setupLogoImageView() {
        logoImageView.image = UIImage(named: "MovieHubLogo.jpeg")
        addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.height.equalTo(150)
        }
    }
    
    private func setupMoviesTextFieldDropDown() {
        moviesTextFieldDropDown.text = "Movies"
        moviesTextFieldDropDown.textColor = .white
        moviesTextFieldDropDown.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        moviesTextFieldDropDown.arrowColor = .white
        addSubview(moviesTextFieldDropDown)
        moviesTextFieldDropDown.snp.makeConstraints { make in
            make.left.equalTo(logoImageView.snp.right).inset(10)
            make.bottom.equalToSuperview().inset(53)
            make.width.greaterThanOrEqualTo(50)
        }
    }
    
    private func setupTvShowsTextFieldDropDown() {
        tvShowsTextFieldDropDown.text = "TV Shows"
        tvShowsTextFieldDropDown.textColor = .white
        tvShowsTextFieldDropDown.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        tvShowsTextFieldDropDown.arrowColor = .white
        addSubview(tvShowsTextFieldDropDown)
        tvShowsTextFieldDropDown.snp.makeConstraints { make in
            make.left.equalTo(moviesTextFieldDropDown.snp.right).offset(20)
            make.bottom.width.equalTo(moviesTextFieldDropDown)
            make.right.equalToSuperview().inset(20)
        }
    }
}
