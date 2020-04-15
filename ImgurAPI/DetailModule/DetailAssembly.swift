//
//  DetailAssembly.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Assembly
class DetailAssembly {
    static func createModule(serviceLocator: ServiceLocator,
                             model: ImageModel) -> UIViewController {
        
        let view = DetailViewController(model: model)
        let state = DetailState()
        let router = DetailRouterImpl(serviceLocator: serviceLocator)
        router.viewController = view
        
        let presenter = DetailPresenterImpl(view: view,
                                            router: router,
                                            state: state)
        view.presenter = presenter
        
        return view
    }
}
