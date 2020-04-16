//
//  DetailProtocols.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

protocol DetailPresenter: AnyObject {
    func downloadComments(imageID: String?)
}

protocol DetailView: AnyObject {
    func setComments(comments: [CommentModel])
}

protocol DetailRouter {
}
