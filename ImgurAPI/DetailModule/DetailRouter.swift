//
//  DetailRouter.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - Router
final class DetailRouterImpl: DetailRouter {
    
    weak var viewController: UIViewController?
    
    private let serviceLocator: ServiceLocator
    
    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
    }
}

//MARK: - Functions
extension DetailRouterImpl {}
