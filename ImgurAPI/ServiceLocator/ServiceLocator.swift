//
//  ServiceLocator.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

protocol ServiceLocator {
    var mainService: MainServiceImpl { get }
}
