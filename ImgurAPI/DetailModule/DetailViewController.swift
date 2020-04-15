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

//    private var model: ImageModel?
    init(model: ImageModel) {
        super.init(nibName: nil,
                   bundle: nil)
        print("modeeeeeL")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
}

//MARK: - Functions

extension DetailViewController {
    
    //MARK: - UI functions
    private func setupUI() {
        view.backgroundColor = .white
        //addsubview
//        view.addSubview(dismissButton)
        
        // add target
//        dismissButton.addTarget(self,
//                                action: #selector(dismissTouchUpInside),
//                                for: .touchUpInside)
        //make constraint
//        dismissButton.setupSNP(topOffset: -10)

    }
    
    //MARK: - @objc functions
    
    //MARK: - another functions
    
}


//MARK: - view

extension DetailViewController: DetailView {}

//MARK: - Constants
extension DetailViewController {}
