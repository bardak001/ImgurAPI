//
//  MainCollectionViewController.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Class
class MainCollectionViewController: UICollectionViewController {
    
    var presenter: MainPresenter?
    
    private let reuseID = "cell"
    
    private var models = [ImageModel]()
    private var recordsArray = [Int]()
    private var page = 1
    private var limit = 10
    let totalEnteries = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.download(page: page)
        setupUI()
        var index = 0
        while index < limit {
            recordsArray.append(index)
            index += 1
        }
    }
    
}

//MARK: - Functions

extension MainCollectionViewController {
    
    //MARK: - UI functions
    private func setupUI() {
        createCollectionView()
        //addsubview
//        view.addSubview(dismissButton)
        
        // add target
//        dismissButton.addTarget(self,
//                                action: #selector(dismissTouchUpInside),
//                                for: .touchUpInside)
        //make constraint
//        dismissButton.setupSNP(topOffset: -10)

    }
    private func createCollectionView() {
        collectionView.backgroundColor = .clear
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: reuseID)
        
        collectionView.register(MainCollectionViewCell.self,
                                forCellWithReuseIdentifier: MainCollectionViewCell.reuseID)
    }
    
    //MARK: - @objc functions
    @objc private func loadCollection() {
        collectionView.reloadData()
        guard recordsArray.count - models.count < 20 else { return }
        page += 1
        presenter?.download(page: page)
    }
    //MARK: - another functions
    
}

//MARK: - UICollectionViewDataSource
extension MainCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        switch recordsArray.count > models.count {
        case true:
            return models.count
        case false:
            return recordsArray.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == recordsArray.count - 1 {
            if recordsArray.count < totalEnteries {
                var index = recordsArray.count
                limit = index + 20
                while index < limit {
                    recordsArray.append(index)
                    index += 1
                }
                self.perform(#selector(loadCollection), with: nil, afterDelay: 2.0)
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseID, for: indexPath) as? MainCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID,
                                                          for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
        cell.setImageModel(models[indexPath.item])
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension MainCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item < models.count else { return}
        presenter?.modelSelected(models[indexPath.item])
    }
}


//MARK: UICollectionViewDelegateFlowLayout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width,
                      height: 80)
    }
}

//MARK: - view

extension MainCollectionViewController: MainView {
    func setImageModels(_ models: [ImageModel]) {
        self.models += models
        collectionView.reloadData()
    }
}

//MARK: - Constants
extension MainCollectionViewController {}
