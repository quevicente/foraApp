//
//  LoginViewController.swift
//  PixelBox
//
//  Created by Vicente Patricio on 06/07/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonEntrar(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Dashboard", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
