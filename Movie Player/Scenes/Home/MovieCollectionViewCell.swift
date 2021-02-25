//
//  MovieCollectionViewCell.swift
//  Movie Player
//
//  Created by Veverly Mae Ricaza Veverly on 2/25/21.
//  Copyright © 2021 Veverly Mae Ricaza. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {

    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    
    var movieViewModel: MovieLatestList.ViewModel.MovieViewModel?{
        didSet{
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        setupPosterImageView()
        setupTitleLabel()
    }
    
    func setupPosterImageView() {
        posterImageView.backgroundColor = .white
        addSubview(posterImageView)
        posterImageView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    private func setupTitleLabel() {
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = .systemPink
        titleLabel.numberOfLines = 2
        titleLabel.backgroundColor = .yellow
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(3)
            make.left.right.equalTo(posterImageView)
            make.height.equalTo(30)
            make.bottom.equalToSuperview()
        }
    }
    
    func updateUI() {
        let placeholderImage = UIImage(named: "ic_no_poster.png")
        let urlString = "\(Constants.MovieApiCred.imageBase)\(movieViewModel?.posterPath ?? "")"
        
        if let url = URL(string: urlString) {
            posterImageView.af.setImage(withURL: url, placeholderImage: placeholderImage)
        }
        titleLabel.text = movieViewModel?.title
    }
}
