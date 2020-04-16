//
//  CommentCollectionViewCell.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 16.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "MainCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillProportionally
            stackView.spacing = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }() 
            private let upsLabel = UILabel()
            private let downsLabel = UILabel()
            private let pointsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setComment(_ comment: CommentModel) {
        prepareForReuse()
        label.text = comment.comment
        upsLabel.text = "ups: \(comment.ups)"
        downsLabel.text = "downs: \(comment.downs)"
        pointsLabel.text = "points: \(comment.points)"
    }
    
}

//MARK: - Functions
extension CommentCollectionViewCell {
    //MARK: - UI functions
    private func setupUI() {
        backgroundColor = .lightGray
        //addsubview
        addSubview(label)
        addSubview(stackView)
        
        //make constraint
        label.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-25)
        }
        stackView.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        stackView.addArrangedSubview(upsLabel)
        stackView.addArrangedSubview(downsLabel)
        stackView.addArrangedSubview(pointsLabel)
    }
    //MARK: - @objc functions
    //MARK: - another functions
}

extension CommentCollectionViewCell {
    private enum Constants {}
}
