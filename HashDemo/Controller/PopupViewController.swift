//
//  PopupViewController.swift
//  HashDemo
//
//  Created by 3Embed on 25/07/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var tokenName: UILabel!
    @IBOutlet weak var tokenImage: UIImageView!
    
    var name = ""
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cloneBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func setupUI() {
        popupView.layer.masksToBounds = true
        popupView.layer.cornerRadius = 5
        tokenImage.image = self.image
    }
   

}
