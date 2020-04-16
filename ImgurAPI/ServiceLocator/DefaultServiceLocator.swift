//
//  DefaultServiceLocator.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation

class DefaultServiceLocator: ServiceLocator {
    
    private let requestManager = RequestManager()
    
    lazy var mainService = MainServiceImpl(requestManager: requestManager)
    lazy var detailService = DetailServiceImpl(requestManager: requestManager)
}
