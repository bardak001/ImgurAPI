//
//  MainProtocols.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

protocol MainPresenter: AnyObject {
    func download(page: Int)
    func modelSelected(_ model: ImageModel)
}

protocol MainView: AnyObject {
    func setImageModels(_ models: [ImageModel])
}

protocol MainRouter {
    func navToDetailModule(_ model: ImageModel)
}

