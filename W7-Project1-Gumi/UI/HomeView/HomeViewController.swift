//
//  HomeViewController.swift
//  W7-Project1-Gumi
//
//  Created by Thành Nguyên on 26/04/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        title = "Home"
    }

    @IBAction func firstOptionTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FirstOptionView", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "firstOptionViewController") as? FirstOptionViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func secondOptionTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondOptionView", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "secondOptionViewController") as? SecondOptionViewController else { return}
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
