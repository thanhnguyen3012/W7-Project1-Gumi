//
//  SecondOptionViewModel.swift
//  W7-Project1-Gumi
//
//  Created by Thành Nguyên on 26/04/2021.
//

import UIKit

protocol SecondOptionViewModelEvents: AnyObject {
    func downloadedPhoto(key: String)
    func showError(error: String)
}

class SecondOptionViewModel {
    
    weak var delegate: SecondOptionViewModelEvents?
    
    let cache = NSCache<NSString, UIImage>()
    
    init(delegate: SecondOptionViewModelEvents) {
        self.delegate = delegate
    }
    
    func getData(link: String) {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respond, error) in
            if let err = error {
                self.delegate?.showError(error: err.localizedDescription)
            } else {
                guard let res = respond as? HTTPURLResponse else { return }
                
                if res.statusCode == 200 {
                    guard let data = data else {
                        self.delegate?.showError(error: "Something wrong.")
                        return
                    }
                    guard let img = UIImage(data: data) else {
                        self.delegate?.showError(error: "Cannot parse data to UIImage.")
                        return
                    }
                    self.cache.setObject(img, forKey: link as NSString)
                    self.delegate?.downloadedPhoto(key: link)
                }  else {
                    self.delegate?.showError(error: "Stop with status code: \(res.statusCode)")
                }
            }
        }).resume()
    }
    
}
