//
//  LandingScreenViewController.swift
//  HashDemo
//
//  Created by 3Embed on 19/07/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class LandingScreenViewController: UIViewController {

    @IBOutlet weak var newAccountBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    @IBAction func newAccountTapped(_ sender: Any) {
        performSegue(withIdentifier: "ToLoginVC", sender: sender)
        
    }
    
    @IBAction func signinTapped(_ sender: Any) {
         performSegue(withIdentifier: "ToLoginVC", sender: sender)
    }
    
    
    func setupUI() {
        newAccountBtn.layer.borderColor = UIColor.blue.cgColor
        newAccountBtn.layer.borderWidth = 1.0
        newAccountBtn.layer.masksToBounds = true
        newAccountBtn.layer.cornerRadius = 3
        signinBtn.layer.masksToBounds = true
        signinBtn.layer.cornerRadius = 3
        
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToLoginVC" {
            if let loginVC = segue.destination as? LoginViewController {
                if let title = (sender as? UIButton)?.currentTitle {
                    loginVC.buttonText = title
                }
            }
        }
    }
 
    
    

}
