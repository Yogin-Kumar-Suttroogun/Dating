//
//  LoginController.swift
//  dating-app
//
//  Created by SUTTROOGUN Yogin Kumar on 02/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var mailBtn: UIButton!
    
    var loginOptions = [String]()
    var loginImg: [String] = ["0-login","1-login","2-login"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    func initialize() {        
        pageControl.numberOfPages = loginImg.count
        for index in 0..<loginImg.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIGradientImageView(frame: frame)
            imgView.image = UIImage(named: loginImg[index])
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(loginImg.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        
        fbBtn.layer.borderWidth = 1
        fbBtn.layer.borderColor = UIColor.init(red: 20/255, green: 132/255, blue: 255/255, alpha: 1).cgColor
        
        mailBtn.layer.borderWidth = 1
        mailBtn.layer.borderColor = UIColor.init(red: 255/255, green: 55/255, blue: 20/255, alpha: 1).cgColor
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK:- UIScrollViewDelegate
extension LoginController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}
