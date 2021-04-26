//
//  SecondOptionViewModel.swift
//  W7-Project1-Gumi
//
//  Created by Thành Nguyên on 26/04/2021.
//

import UIKit

protocol SecondOptionViewModelEvents: class {
    func downloadedPhoto()
    func showError(error: String)
}

class SecondOptionViewModel {
    
    weak var delegate: SecondOptionViewModelEvents?
    
    var listOfPhotos = [UIImage]()
    
    init(delegate: SecondOptionViewModelEvents) {
        self.delegate = delegate
    }
    
    func getData(links: [String]) {
        for link in links {
            guard let url = URL(string: link) else { return }
            
            DispatchQueue.global(qos: .default).async {
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
                            self.listOfPhotos.append(img)
                            self.delegate?.downloadedPhoto()
                        }  else {
                            self.delegate?.showError(error: "Stop with status code: \(res.statusCode)")
                        }
                    }
                }).resume()
            }
        }
    }
    
}
