//
//  FirstOptionViewModel.swift
//  W7-Project1-Gumi
//
//  Created by Thành Nguyên on 26/04/2021.
//

import UIKit

protocol FirstViewModelEvents: class {
    func dataDownloaded(photo: UIImage)
    func showError(error: String)
}

class  FirstViewModel {
    weak var delegate: FirstViewModelEvents?
    var listOfPhotos = [UIImage]()
    
    init(delegate: FirstViewModelEvents) {
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
                            self.delegate?.dataDownloaded(photo: img)
                        } else {
                            self.delegate?.showError(error: "Stop with status code: \(res.statusCode)")
                        }
                    }
                }).resume()
            }
        }
    }
}
