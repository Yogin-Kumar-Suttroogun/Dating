//
//  SignController.swift
//  dating-app
//
//  Created by Yogin Kumar SUTTROOGUN on 05/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class SignController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    func initialize() {
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2
        imgProfile.clipsToBounds = true
        imgProfile.layer.borderColor = UIColor.white.cgColor
        imgProfile.layer.borderWidth = 2
    }
}
