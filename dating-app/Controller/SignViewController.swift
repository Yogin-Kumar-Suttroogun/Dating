//
//  SignViewController.swift
//  dating-app
//
//  Created by Yogin Kumar SUTTROOGUN on 05/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var fNameTxtFld: DesignableTextField! {
        didSet {
            fNameTxtFld.delegate = self
        }
    }
    @IBOutlet weak var dobTxtFld: DesignableTextField! {
        didSet {
            dobTxtFld.delegate = self
        }
    }
    @IBOutlet weak var genderTxtFld: DesignableTextField! {
        didSet {
            genderTxtFld.delegate = self
        }
    }
    @IBOutlet weak var interestedInTxtFld: DesignableTextField! {
        didSet {
            interestedInTxtFld.delegate = self
        }
    }
    @IBOutlet weak var locationTxtFld: DesignableTextField! {
        didSet {
            locationTxtFld.delegate = self
        }
    }
    @IBOutlet weak var pwdTxtFld: DesignableTextField! {
        didSet {
            pwdTxtFld.delegate = self
        }
    }
    
    fileprivate var alertStyle: UIAlertController.Style = .actionSheet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }
    
    func initialize() {
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2
        imgProfile.clipsToBounds = true
        imgProfile.layer.borderColor = UIColor.white.cgColor
        imgProfile.layer.borderWidth = 2
        
//        let genderAndInterestedInTap = UITapGestureRecognizer(target: self, action: #selector(genderAndInterestedIn(tapGesture:)))
////        genderTxtFld.addGestureRecognizer(genderAndInterestedInTap)
//        self.genderTxtFld.addGestureRecognizer(genderAndInterestedInTap)
//        self.interestedInTxtFld.addGestureRecognizer(genderAndInterestedInTap)
    }
    
    
    func didBeginEditing() {
        
    }
}

// MARK:- UITextFieldDelegate
extension SignViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return false
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            dob()
        case 2:
            genderAndInterestedIn(title:"Gender", message: "Select your gender")
        case 3:
            genderAndInterestedIn(title: "Interested In", message: "Select the gender you are interested in")
        case 4:
            location()
        default:
            print("default")
        }
    }
    
    func dob() {
        let alert = UIAlertController(title: "Date", message: "Select your date of birth", preferredStyle: self.alertStyle)
        alert.addDatePicker(mode: .dateAndTime, date: Date(), minimumDate: nil, maximumDate: nil) { date in
            Log(date)
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show()
    }
    
//    @IBAction func genderAndInterestedIn(tapGesture: UITapGestureRecognizer) {
//        print(tapGesture.view?.tag)
    
    func genderAndInterestedIn(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: self.alertStyle)
        let pickerViewValues: [[String]] = [["Male","Female"]]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: 0)

        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in

            DispatchQueue.main.async {
                UIView.animate(withDuration: 1) {
                    print(index.row)
                }
            }
        }
        alert.addAction(title: "Done", style: .cancel)
        self.present(alert, animated: true, completion: nil)
//        alert.show()
    }
    
    func location() {
        let alert = UIAlertController(style: self.alertStyle)
        alert.addLocalePicker(type: .country) { info in Log(info) }
        alert.addAction(title: "Cancel", style: .cancel)
        alert.show()
    }
}
