//
//  ProfileViewController.swift
//  dating-app
//
//  Created by SUTTROOGUN Yogin Kumar on 16/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editProfileBtnTap(_ sender: Any) {
        let settingsVC = SettingTableViewController()
        let navController = UINavigationController(rootViewController: settingsVC)
        present(navController, animated: true)
    }
}
