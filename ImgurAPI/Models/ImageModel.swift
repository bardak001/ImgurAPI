//
//  ImageModel.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation

class ImageModel {
    var id = ""
    var datetime = 0
    var description = ""
    var favorite = 0
    var link = ""
    var title = ""
    var views = 0
    var comments = [String]()
    init(id: String,
         datetime: Int,
         description: String,
         favorite: Int,
         link: String,
         title: String,
         views: Int) {
        self.id = id
        self.datetime = datetime
        self.description = description
        self.favorite = favorite
        self.link = link
        self.title = title
        self.views = views
    }
}
