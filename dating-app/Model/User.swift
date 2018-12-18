//
//  User.swift
//  dating-app
//
//  Created by Yogin Kumar SUTTROOGUN on 17/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import Foundation
import UIKit

struct User: ProducesCardViewModel {
//    Attributes
    let name: String
    let age: Int
    let profession: String
    let imgName: String
    
    func toCardViewModel() -> CardViewModel {
        let attributedText = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
        
        attributedText.append(NSAttributedString(string: " \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
        
        attributedText.append(NSAttributedString(string: "\n\(profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        
        return CardViewModel(imgName: imgName, attributedString: attributedText, textAligment: .left)
    }
}
