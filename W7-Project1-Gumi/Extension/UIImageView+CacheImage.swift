//
//  UIImageView+CacheImage.swift
//  W7-Project1-Gumi
//
//  Created by Thành Nguyên on 05/05/2021.
//

import UIKit

extension UIImageView {
    static let imageCache = NSCache<NSString, UIImage>()//NSCache<AnyObject, AnyObject>()
    
    func getImage(url stringUrl: String, completionHandler: @escaping (UIImage?) -> ()) {
        if let img = UIImageView.imageCache.object(forKey: NSString(string: stringUrl)) {
            completionHandler(img)
        } else {
            guard let url = URL(string: stringUrl) else { return }
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, respond, error) in
                if error == nil && data != nil {
                    guard let res = respond as? HTTPURLResponse else { return }
                    if res.statusCode == 200 {
                        let img = UIImage(data: data!)
                        DispatchQueue.main.async {
                            UIImageView.imageCache.setObject(img!, forKey: NSString(string: String(stringUrl)))
                            completionHandler(img)
                        }
                    }
                }
            }).resume()
        }
    }
    
}
