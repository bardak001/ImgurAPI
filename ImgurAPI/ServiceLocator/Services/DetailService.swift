//
//  DetailService.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 16.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation

//MARK: - Service
class DetailServiceImpl {
    
    private var requestManager: RequestManager
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
}

extension DetailServiceImpl {
    func downloadComments(imageID: String, complection: @escaping (_ comments: [CommentModel]?, _ error: String?) -> () ) {
        let urlString = "https://api.imgur.com/3/gallery/\(imageID)/comments/top"
        RequestManager.sendRequest(urlString, parameters: [:]) { responseObject, error in
            guard let responseObject = responseObject,
                error == nil,
                let datasets = responseObject["data"] as? [[String: Any]] else {
                    complection(nil, error?.localizedDescription ?? "error")
                    return
            }
            var commentArray = [CommentModel]()
            for data in datasets {
                if let comment = data["comment"] as? String,
                    let ups = data["ups"] as? Int,
                    let downs = data["downs"] as? Int,
                    let points = data["points"] as? Int {
                    let comment = CommentModel(comment: comment,
                                               ups: ups,
                                               downs: downs,
                                               points: points)
                    commentArray.append(comment)
                }
            }
            complection(commentArray, nil)
        }
    }
}
