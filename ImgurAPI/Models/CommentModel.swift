//
//  CommentModel.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 16.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation

class CommentModel {
    var comment = ""
    var ups = 0
    var downs = 0
    var points = 0
    init(comment: String,
         ups: Int,
         downs: Int,
         points: Int) {
        self.comment = comment
        self.ups = ups
        self.downs = downs
        self.points = points
    }
}
