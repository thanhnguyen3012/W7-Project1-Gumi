//
//  PhotoTableViewCell.swift
//  W7-Project1-Gumi
//
//  Created by Thành Nguyên on 26/04/2021.
//

import UIKit

protocol PhotoTableViewCellDelegate {
    func photoTableViewCell(photoTableViewCell: PhotoTableViewCell, updateHeightForRow: Int, atIndex: Int)
}

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loadedImageView: UIImageView!
    @IBOutlet weak var downloadingIndicatorView: UIActivityIndicatorView!
    
    var delegate: PhotoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isSelected = false
    }
    
    override func prepareForReuse() {
        loadedImageView.image = nil
    }
    func loadImage(url: String, index: Int) {
        downloadingIndicatorView.startAnimating()

        loadedImageView.getImage(url: url, completionHandler: { (img) in
            guard let image = img else { return }
            if self.tag == index {
                self.loadedImage(img: image, index: index)
            }
        })
    }
    
    func loadedImage(img: UIImage, index: Int) {
        loadedImageView.image = img
        downloadingIndicatorView.stopAnimating()
        delegate?.photoTableViewCell(photoTableViewCell: self, updateHeightForRow: Int(img.size.height), atIndex: index)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
