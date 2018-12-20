//
//  RegistrationViewModel.swift
//  dating-app
//
//  Created by Yogin Kumar SUTTROOGUN on 19/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class RegistrationViewModel {
    var fullName: String? { didSet {checkFormValidity()}}
    var dob: String? { didSet {checkFormValidity()}}
    var gender: String? { didSet {checkFormValidity()}}
    var interestedIn: String? { didSet {checkFormValidity()}}
    var location: String? { didSet {checkFormValidity()}}
    var password: String? { didSet {checkFormValidity()}}
    
    fileprivate func checkFormValidity() {
        let isFormValid = fullName?.isEmpty == false && dob?.isEmpty == false && gender?.isEmpty == false && interestedIn?.isEmpty == false && location?.isEmpty == false && password?.isEmpty == false 
        isFormValidObserver?(isFormValid)
    }
    
//    Reactive programming
    var isFormValidObserver: ((Bool) -> ())?
}
