//
//  HomeViewController.swift
//  HashDemo
//
//  Created by 3Embed on 22/07/19.
//  Copyright © 2019 Demo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var tokensTable: UITableView!
    var coins: [UIImage?] = [UIImage(named: "1") ,
    UIImage(named: "2"),
    UIImage(named: "3"),
    UIImage(named: "4"),
    UIImage(named: "5"),
    UIImage(named: "6"),
    UIImage(named: "7"),
    UIImage(named: "8"),
    UIImage(named: "9"),
    UIImage(named: "10")]
    
    var userHash = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        lpgr.minimumPressDuration = 0.5
        lpgr.delaysTouchesBegan = true
        lpgr.delegate = self
        self.tokensTable.addGestureRecognizer(lpgr)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func showHashTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Hash", message: userHash , preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func handleLongPress(recognizer: UITapGestureRecognizer)  {
        if recognizer.state == UIGestureRecognizer.State.ended {
            let tapLocation = recognizer.location(in: self.tokensTable)
            if let tapIndexPath = self.tokensTable.indexPathForRow(at: tapLocation) {
                if let tappedCell = self.tokensTable.cellForRow(at: tapIndexPath) as? TokenCell {
                    
                print("\(tapIndexPath.row) tapped" )
                    openPopup(index: tapIndexPath.row)
                }
            }
        }
    }
    
    func openPopup(index: Int) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:"PopupViewController" ) as? PopupViewController
        vc?.name = "Token \(index + 1)"
        vc?.image = coins[index]!
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overCurrentContext
        present(vc!, animated: true, completion: nil)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "TokenCell") as! TokenCell
        cell.tokenName.text = "Token \(indexPath.row + 1)"
        cell.tokenLogo.image = coins[indexPath.row]
        cell.tokenShortName.text = "TKN \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openPopup(index: indexPath.row)
    }
    
}
