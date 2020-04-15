//
//  MainAssembly.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Assembly
class MainAssembly {
    static func createModule(serviceLocator: ServiceLocator) -> UIViewController {
        
        let view = MainCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let state = MainState()
        let router = MainRouterImpl(serviceLocator: serviceLocator)
        router.viewController = view
        
        let presenter = MainPresenterImpl(view: view,
                                          router: router,
                                          state: state,
                                          service: serviceLocator.mainService)
        view.presenter = presenter
        
        return view
    }
}
