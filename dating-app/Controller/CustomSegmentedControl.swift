//
//  CustomSegmentedControl.swift
//  dating-app
//
//  Created by Yogin Kumar SUTTROOGUN on 05/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIView {
    var buttons = [UIButton]()
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable
    var commaSeparatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        buttons.removeAll()
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            buttons.append(button)
        }
        
        
    }
    
    override func draw(_ rect: CGRect) {
         layer.cornerRadius = frame.height/2
    }
}
