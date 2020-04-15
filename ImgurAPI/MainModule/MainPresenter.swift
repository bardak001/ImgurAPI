//
//  MainPresenter.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Presenter
class MainPresenterImpl: MainPresenter {

    let view: MainView
    let router: MainRouter
    let state: MainState
    
    // MARK: - Service
    let service: MainServiceImpl
    
    // MARK: - Init
    init(view: MainView,
         router: MainRouter,
         state: MainState,
         service: MainServiceImpl) {
        self.view = view
        self.router = router
        self.state = state
        self.service = service
    }
}

//MARK: - Functions
extension MainPresenterImpl {
    func download(page: Int) {
        service.download(page: page) { models, error  in
            guard let models = models, error == nil else { return }
            DispatchQueue.main.async {
                self.view.setImageModels(models)
            }
            
        }
    }
    func modelSelected(_ model: ImageModel) {
        router.navToDetailModule(model)
    }
}
