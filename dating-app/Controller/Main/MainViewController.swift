//
//  MainViewController.swift
//  dating-app
//
//  Created by SUTTROOGUN Yogin Kumar on 15/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let topStackView = TopNavigationStackView()
    let cardsDeckView = UIView()
    let buttonsStackView = HomeBottomControlsStackView()
    
    let cardViewModels = [
        User(name: "Kelly", age: 23, profession: "Music Dj", imgName: "lady5c").toCardViewModel(),
        User(name: "Jane", age: 18, profession: "Teacher", imgName: "lady4c").toCardViewModel()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()        
        setupDummyCards()
    }
    
    fileprivate func setupDummyCards() {
        
        cardViewModels.forEach { (cardVM) in
            let cardView = CardView(frame: .zero)
            cardView.imgView.image = UIImage(named: cardVM.imgName)
            cardView.informationLbl.attributedText = cardVM.attributedString
            cardView.informationLbl.textAlignment = cardVM.textAligment
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
    
    // MARK:- Fileprivate
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        overallStackView.bringSubviewToFront(cardsDeckView)
    }

}
