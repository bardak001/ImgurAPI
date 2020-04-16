//
//  MainCollectionViewCell.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "MainCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageModel(_ model: ImageModel) {
        prepareForReuse()
        let url = URL(string: model.link)
        imageView.kf.setImage(with: url)
        label.text = model.title
    }
    
}

//MARK: - Functions
extension MainCollectionViewCell {
    //MARK: - UI functions
    private func setupUI() {
        backgroundColor = .lightGray
        imageView.layer.cornerRadius = (bounds.height - 20) / 2
        //addsubview
        addSubview(imageView)
        addSubview(label)
        //make constraint
        imageView.snp.makeConstraints {
            $0.leading.equalTo(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(bounds.height - 20)
        }
        label.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.top.trailing.bottom.equalToSuperview()
        }
    }
    //MARK: - @objc functions
    //MARK: - another functions
}

extension MainCollectionViewCell {
    private enum Constants {}
}
