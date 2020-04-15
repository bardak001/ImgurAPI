//
//  MainService.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import Foundation

//MARK: - Service
class MainServiceImpl {
    
    private var requestManager: RequestManager
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
}

extension MainServiceImpl {
    func download(page: Int, complection: @escaping (_ models: [ImageModel]?, _ error: String?) -> () ) {
        let urlString = "https://api.imgur.com/3/gallery/top/top/all/\(page)"
        
        let parameters: [String : String] = [
            "showViral": "false",
            "mature": "false",
            "album_previews": "false"
        ]
        let headers: [String: String] = [
            "Authorization": "Client-ID dbc3c5c75b03803"
        ]
        RequestManager.sendRequest(urlString, parameters: parameters, headers: headers) { responseObject, error in
            guard let responseObject = responseObject,
                error == nil,
                let datasets = responseObject["data"] as? [[String: Any]] else {
                    complection(nil, error?.localizedDescription ?? "error")
                return
            }
            var imageArray = [ImageModel]()
            for data in datasets {
                if let images = data["images"] as? [[String: Any]], let image = images.first  {
                    let imageModel = ImageModel(datetime: image["datetime"] as? Int ?? 0,
                                                description: image["description"] as? String ?? "",
                                                favorite: image["favorite"] as? Int ?? 0,
                                                link: image["link"] as? String ?? "",
                                                title: data["title"] as? String ?? "",
                                                views: image["views"] as? Int ?? 0)
                    imageArray.append(imageModel)
//                    print("image: datetime - \(imageModel.datetime), description - \(imageModel.description), favorite - \(imageModel.favorite), link - \(imageModel.link), title - \(imageModel.title), views - \(imageModel.views)")
                }
            }
            complection(imageArray, nil)
        }
    }
}
