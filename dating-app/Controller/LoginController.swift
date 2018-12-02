//
//  LoginController.swift
//  dating-app
//
//  Created by SUTTROOGUN Yogin Kumar on 02/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    var loginOptions = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    func initialize() {
        loginOptions = ["Login with Facebook","Login with Phone number"]
        let nibName = UINib(nibName: "LoginTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "loginCell")
    }
}

// MARK:- UITableViewDelegate, UITableViewDataSource
extension LoginController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loginOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let loginCell = tableView.dequeueReusableCell(withIdentifier: "loginCell", for: indexPath) as? LoginTableViewCell {
            loginCell.loginLbl.text = loginOptions[indexPath.row]
            return loginCell
        }
        return UITableViewCell()
    }
    
    
}
