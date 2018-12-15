//
//  CardView.swift
//  dating-app
//
//  Created by SUTTROOGUN Yogin Kumar on 15/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    fileprivate let imgView = UIImageView(image: #imageLiteral(resourceName: "lady5c"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        Custom drawing code
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(imgView)
        imgView.fillSuperview()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded()
        default:
            ()
        }
    }
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            self.transform = .identity
        }) { (_) in
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
