//
//  CommentCollectionView.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 16.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Class
class CommentCollectionView: UICollectionView {
    
    private let reuseID = "cell"
    private var comments = [CommentModel]()
    
    init() {
        super.init(frame: .zero,
                   collectionViewLayout: UICollectionViewFlowLayout())
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setComments(comments: [CommentModel]) {
        self.comments = comments
        reloadData()
    }
}

//MARK: - Functions

extension CommentCollectionView {
    
    //MARK: - UI functions
    private func setupUI() {
        createCollectionView()
    }
    private func createCollectionView() {
        backgroundColor = .white
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        
        dataSource = self
        delegate = self
        
        register(UICollectionViewCell.self,
                 forCellWithReuseIdentifier: reuseID)
        
        register(CommentCollectionViewCell.self,
                 forCellWithReuseIdentifier: CommentCollectionViewCell.reuseID)
    }
    
    //MARK: - @objc functions
    
    //MARK: - another functions
    
}

//MARK: - UICollectionViewDataSource
extension CommentCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch comments.count > 10 {
        case true:
            return 10
        case false:
            return comments.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommentCollectionViewCell.reuseID, for: indexPath) as? CommentCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID,
                                                          for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
        cell.setComment(comments[indexPath.item])
        return cell
    }
    
}

//MARK: UICollectionViewDelegateFlowLayout
extension CommentCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = comments[indexPath.item].comment
        let height = text.getEstimateFrameForText(width: bounds.width, font: nil).height + 30
        return CGSize(width: frame.width,
                      height: height)
    }
}
//MARK: - String
extension String {
    
    func getEstimateFrameForText(width: CGFloat?,
                                 font: UIFont?) -> CGRect {
        let text = self
        let size = CGSize(width: width ?? 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attributes = [NSAttributedString.Key.font : font ?? UIFont.systemFont(ofSize: 16)]
        return NSString(string: text).boundingRect(with: size,
                                                   options: options,
                                                   attributes: attributes,
                                                   context: nil)
    }
}
