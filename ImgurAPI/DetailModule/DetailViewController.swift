//
//  DetailViewController.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Class
class DetailViewController: UIViewController {
    
    var presenter: DetailPresenter?
    var model: ImageModel?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
        private let datetimeLabel = UILabel()
        private let favoriteLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            return label
        }()
        private let viewsLabel = UILabel()
    
    private let collectionView = CommentCollectionView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.downloadComments(imageID: model?.id)
        if let model = model {
            let url = URL(string: model.link)
            titleLabel.text = model.title
            imageView.kf.setImage(with: url)
            
            let date = Date(timeIntervalSince1970: TimeInterval(model.datetime))
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let localDate = dateFormatter.string(from: date)
            
            datetimeLabel.text = "\(localDate)"
            favoriteLabel.text = "favorite: \(model.title)"
            viewsLabel.text = "views: \(model.views)"
        }
        
        setupUI()
    }
    
}

//MARK: - Functions

extension DetailViewController {
    
    //MARK: - UI functions
    private func setupUI() {
        view.backgroundColor = .white
        //addsubview
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(stackView)
        view.addSubview(collectionView)
        //make constraint
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(5)
            $0.leading.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.width.height.equalTo(150)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top)
            $0.leading.equalTo(imageView.snp.trailing).offset(20)
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.trailing.equalToSuperview().offset(-20)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        stackView.addArrangedSubview(datetimeLabel)
        stackView.addArrangedSubview(favoriteLabel)
        stackView.addArrangedSubview(viewsLabel)
    }
    
    //MARK: - @objc functions
    //MARK: - another functions
}

//MARK: - view
extension DetailViewController: DetailView {
    func setComments(comments: [CommentModel]) {
        let commentSortered = comments.sorted(by: {$0.points > $1.points})
        collectionView.setComments(comments: commentSortered)
    }
}

//MARK: - Constants
extension DetailViewController {}
