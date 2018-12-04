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
    
    var loginOptions = [String]()
    var loginImg: [String] = ["0","1","2"]
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
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: loginImg[index])
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(loginImg.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
    }
}

// MARK:- UIScrollViewDelegate
extension LoginController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}
