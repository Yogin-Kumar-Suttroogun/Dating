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
    }
    
    @IBAction func registerBtnTap(_ sender: Any) {
        
    }
}

// MARK:- TextField

extension SignViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            self.view.endEditing(true)
            dob()
            return false
        case 2:
            self.view.endEditing(true)
            genderAndInterestedIn(title:"Gender", message: "Select your gender")
            return false
        case 3:
            self.view.endEditing(true)
            genderAndInterestedIn(title: "Interested In", message: "Select the gender you are interested in")
            return false
        case 4:
            self.view.endEditing(true)
            location()
            return false
        default:
            return true
        }
    }
    func dob() {
        let alert = UIAlertController(title: "Date", message: "Select your date of birth", preferredStyle: self.alertStyle)
        alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: nil) { date in
            Log(date.dateString())
        }
        alert.addAction(title: "Done", style: .cancel, handler: {(alert: UIAlertAction!) in
//            When button done is clicked then perform saving
            print("Done clicked!")
        })
        self.present(alert, animated: true, completion: nil)
    }
    
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
    }
    
    func location() {
        let alert = UIAlertController(style: self.alertStyle)
        alert.addLocalePicker(type: .country) { info in Log(info) }
        alert.addAction(title: "Cancel", style: .cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
