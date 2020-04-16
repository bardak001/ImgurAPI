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
    
    // MARK: - Service
    let service: DetailServiceImpl
    
    // MARK: - Init
    init(view: DetailView,
         router: DetailRouter,
         state: DetailState,
         service: DetailServiceImpl) {
        self.view = view
        self.router = router
        self.state = state
        self.service = service
    }
}

//MARK: - Functions
extension DetailPresenterImpl {
    func downloadComments(imageID: String?) {
        guard let imageID = imageID else { return }
        service.downloadComments(imageID: imageID) { comments, error in
            guard let comments = comments, error == nil else { return }
            DispatchQueue.main.async {
                self.view.setComments(comments: comments)
            }
        }
    }
}
