//
//  SecondOptionViewController.swift
//  W7-Project1-Gumi
//
//  Created by Thành Nguyên on 26/04/2021.
//

import UIKit

class SecondOptionViewController: UIViewController {

    @IBOutlet weak var photoTableView: UITableView!
    
    let links = ["https://images.unsplash.com/photo-1552083375-1447ce886485?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
                 "https://images.unsplash.com/photo-1610818544205-9830e171384c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
"https://images.unsplash.com/photo-1612855619754-64a7c41db296?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
"https://images.unsplash.com/photo-1617120509865-a3cc8fdc0a0f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2978&q=80",
"https://images.unsplash.com/photo-1571366343168-631c5bcca7a4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2251&q=80",
"https://images.unsplash.com/photo-1568897451406-94d62ae18aea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1300&q=80",
"https://images.unsplash.com/photo-1614771243521-7554dccb34c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80",
"https://images.unsplash.com/photo-1577996447834-c360b24977fb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1276&q=80",
"https://images.unsplash.com/photo-1615800792790-e3ce75c49f7c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
"https://images.unsplash.com/photo-1560262829-d47e51d95ee8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2978&q=80",
"https://images.unsplash.com/photo-1526035266069-fc237c5baddd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80",
"https://images.unsplash.com/photo-1559180377-78572fb6e06f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
"https://images.unsplash.com/photo-1610123598147-f632aa18b275?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2978&q=80",
"https://images.unsplash.com/photo-1615235225749-2d727548bd10?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3061&q=80",
"https://images.unsplash.com/photo-1612698093158-e07ac200d44e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80",
"https://images.unsplash.com/photo-1605007493699-af65834f8a00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2102&q=80",
"https://images.unsplash.com/photo-1614102073832-030967418971?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80",
"https://images.unsplash.com/photo-1619419497368-12c94fae126b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80",
"https://images.unsplash.com/photo-1619418919159-c28ea91ad1f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80",
"https://images.unsplash.com/photo-1619371039016-b4b8356287ef?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1231&q=80",
"https://images.unsplash.com/photo-1569389397653-c04fe624e663?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1234&q=80"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "You choosed second option"
        
        photoTableView.register(PhotoTableViewCell.nib, forCellReuseIdentifier: PhotoTableViewCell.identifier)
        photoTableView.delegate = self
        photoTableView.dataSource = self
    }

}

extension SecondOptionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier, for: indexPath) as? PhotoTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        cell.tag = indexPath.row
        cell.loadImage(url: links[indexPath.row], index: indexPath.row)
        return cell
    }
    
    
}

extension SecondOptionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let img = UIImageView.imageCache.object(forKey: NSString(string: links[indexPath.row])) else { return 50 }
        return self.view.frame.width * (img.size.height / img.size.width)
    }
}

extension SecondOptionViewController: PhotoTableViewCellDelegate {
    func photoTableViewCell(photoTableViewCell: PhotoTableViewCell, updateHeightForRow: Int, atIndex: Int) {
        photoTableView.reloadRows(at: [IndexPath(row: atIndex, section: 0)], with: .none)
    }
}
