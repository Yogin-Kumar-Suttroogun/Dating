//
//  CardViewModel.swift
//  dating-app
//
//  Created by Yogin Kumar SUTTROOGUN on 18/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import Foundation
import UIKit

protocol ProducesCardViewModel {
    func toCardViewModel() -> CardViewModel
}

class CardViewModel {
    let imgNames: [String]
    let attributedString: NSAttributedString
    let textAligment: NSTextAlignment
    
    init(imgNames: [String], attributedString: NSAttributedString, textAligment: NSTextAlignment) {
        self.imgNames = imgNames
        self.attributedString = attributedString
        self.textAligment = textAligment
    }
    
    fileprivate var imgIndex = 0 {
        didSet{
            let ImgName = imgNames[imgIndex]
            let img = UIImage(named: ImgName)
            imgIndexObserver?(imgIndex, img)
        }
    }
    
//    Reactive Programming
    var imgIndexObserver: ((Int, UIImage?) -> ())?
    
    func advanceToNextPhoto() {
        imgIndex = min(imgIndex + 1, imgNames.count - 1)
    }
    
    func goToPreviousPhoto() {
        imgIndex = max(0, imgIndex - 1)
    }
}
