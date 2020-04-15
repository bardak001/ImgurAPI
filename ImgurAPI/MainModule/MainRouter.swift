//
//  MainRouter.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Router
final class MainRouterImpl: MainRouter {
    
    weak var viewController: UIViewController?
    
    private let serviceLocator: ServiceLocator
    
    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
    }
}

//MARK: - Functions
extension MainRouterImpl {
    func navToDetailModule(_ model: ImageModel) {
        let vc = DetailAssembly.createModule(serviceLocator: serviceLocator,
                                             model: model)
        viewController?.present(vc,
                                animated: true,
                                completion: nil)
    }
}
