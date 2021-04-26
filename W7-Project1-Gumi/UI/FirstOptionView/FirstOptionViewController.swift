//
//  FirstOptionViewController.swift
//  W7-Project1-Gumi
//
//  Created by Thành Nguyên on 26/04/2021.
//

import UIKit

class FirstOptionViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    lazy var viewModel = FirstViewModel(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "You choosed first option"
        
        viewModel.getData(links: ["https://images.unsplash.com/photo-1512850183-6d7990f42385?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80",
                                  "https://images.unsplash.com/photo-1580135657397-82accd914ef8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=886&q=80",
                                  "https://images.unsplash.com/photo-1508179522353-11ba468c4a1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
                                  "https://images.unsplash.com/photo-1580775540283-999441f7c437?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80",
                                  "https://images.unsplash.com/photo-1517586979036-b7d1e86b3345?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80"])
        
        
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 0)
    }

}

extension FirstOptionViewController: FirstViewModelEvents {
    func showError(error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func dataDownloaded(photo: UIImage) {
        DispatchQueue.main.async {
            let imageView = UIImageView(frame: CGRect(x: 0, y: self.scrollView.contentSize.height, width: self.scrollView.contentSize.width, height: self.scrollView.contentSize.width * (photo.size.height / photo.size.width)))
            imageView.image = photo
            imageView.contentMode = .scaleAspectFill
            
            self.scrollView.addSubview(imageView)
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.contentSize.height + imageView.frame.height)
        }
    }
}
