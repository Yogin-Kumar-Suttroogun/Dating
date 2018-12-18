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

struct CardViewModel {
    let imgName: String
    let attributedString: NSAttributedString
    let textAligment: NSTextAlignment
}
