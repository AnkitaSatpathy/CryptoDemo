//
//  LoginViewController.swift
//  HashDemo
//
//  Created by 3Embed on 19/07/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit
import CryptoSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var buttonText = ""
    let keychainWrapper = KeychainWrapper()
    let salt = "x4vV8bGgqqmQwgCoyXFQj+(o.nUNQhVP7ND"
    var loginhash = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
      
    }
   
    
    func setupUI() {
         loginBtn.setTitle(buttonText, for: .normal)
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.cornerRadius = 3
    }
    
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
        if buttonText == "New Account" {
             keychainWrapper.addData(with: passwordTF.text ?? "dummy", forKey: usernameTF.text ?? "dummy")
            performSegue(withIdentifier: "ToHomeVC", sender: nil)
        } else { //Login
            if let keychainPassword = keychainWrapper.getData(forKey: usernameTF.text ?? "dummy") {
             let  decryptedPassword = NSString(data: keychainPassword as Data, encoding: String.Encoding.utf8.rawValue) as String?
                if passwordTF.text == decryptedPassword {
                    loginhash = "\(String(describing: decryptedPassword)).\(usernameTF.text).\(salt)".sha256()
                    print("hash is \(loginhash)")
                    
                    performSegue(withIdentifier: "ToHomeVC", sender: nil)
                }
            } else {
                let alert = UIAlertController(title: "Alert", message: "Username not found", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        }
        
       
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ToHomeVC" {
            let vc = segue.destination as? HomeViewController
            vc?.userHash = loginhash
        }
    }
 

}
