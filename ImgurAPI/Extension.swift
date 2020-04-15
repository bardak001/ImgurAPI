//
//  Extension.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit

//MARK: - UIImageView
let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    func loadImageUsingCacheWithUrlStringEXT(urlString: String) {
        image = nil
        
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            image = cachedImage
            return
        }
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url,
                                       completionHandler: { (data, response, error) in
                guard error == nil,
                    let data = data else { return }
                DispatchQueue.main.async {
                    if let downloadedImage = UIImage(data: data) {
                        imageCache.setObject(downloadedImage,
                                             forKey: urlString as AnyObject)
                        self.image = UIImage(data: data)
                    }
                }
            }).resume()
        }
        
    }
}
