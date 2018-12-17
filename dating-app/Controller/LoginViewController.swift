//
//  LoginViewController.swift
//  dating-app
//
//  Created by SUTTROOGUN Yogin Kumar on 02/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var mailBtn: UIButton!
    
    var loginOptions = [String]()
    var loginImg: [String] = ["0-login","1-login","2-login"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        initialize()
    }
    
    func initialize() {
        pageControl.numberOfPages = loginImg.count
        for index in 0..<loginImg.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIGradientImageView(frame: frame)
            imgView.image = UIImage(named: loginImg[index])
            imgView.contentMode = .scaleAspectFill
            imgView.clipsToBounds = true
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(loginImg.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
//        Localizing the app
        mailBtn.setTitle(NSLocalizedString("login.email", comment: ""), for: .normal)
    }
    
//    Changing the top view text
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK:- ScrollView

extension LoginViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}
