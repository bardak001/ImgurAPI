//
//  DetailPresenter.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Presenter
class DetailPresenterImpl: DetailPresenter {

    let view: DetailView
    let router: DetailRouter
    let state: DetailState
    
    // MARK: - Init
    init(view: DetailView,
         router: DetailRouter,
         state: DetailState) {
        self.view = view
        self.router = router
        self.state = state
    }
}

//MARK: - Functions
extension DetailPresenterImpl {}
