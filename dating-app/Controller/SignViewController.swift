//
//  SignViewController.swift
//  dating-app
//
//  Created by Yogin Kumar SUTTROOGUN on 05/12/2018.
//  Copyright © 2018 SUTTROOGUN Yogin Kumar. All rights reserved.
//

import UIKit
import Firebase
import JGProgressHUD

class SignViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var fNameTxtFld: DesignableTextField! {
        didSet {
            fNameTxtFld.delegate = self
            fNameTxtFld.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        }
    }
    @IBOutlet weak var dobTxtFld: DesignableTextField! {
        didSet {
            dobTxtFld.delegate = self
            dobTxtFld.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        }
    }
    @IBOutlet weak var genderTxtFld: DesignableTextField! {
        didSet {
            genderTxtFld.delegate = self
            genderTxtFld.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        }
    }
    @IBOutlet weak var interestedInTxtFld: DesignableTextField! {
        didSet {
            interestedInTxtFld.delegate = self
            interestedInTxtFld.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        }
    }
    @IBOutlet weak var locationTxtFld: DesignableTextField! {
        didSet {
            locationTxtFld.delegate = self
            locationTxtFld.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        }
    }
    @IBOutlet weak var pwdTxtFld: DesignableTextField! {
        didSet {
            pwdTxtFld.delegate = self
            pwdTxtFld.addTarget(self, action: #selector(handleTextChanged), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var registerBtn: DesignableButton!
    @IBOutlet weak var stackTxtFld: UIStackView!
    let registrationViewModel = RegistrationViewModel()
    var gender: Bool = false
    
    fileprivate var alertStyle: UIAlertController.Style = .actionSheet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        setupNotificationObserver()
        setupTapGesture()
        setupRegistrationViewModelObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        You will have a retain cycle
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func setupRegistrationViewModelObserver() {
        registrationViewModel.isFormValidObserver = { (isFormValid) in
            print("Is it valid?", isFormValid)
//            Can disable the register button then re-enable it afterward
        }
    }
    
    @objc fileprivate func handleTextChanged(textField: UITextField) {
        switch textField.tag {
        case 0:
            registrationViewModel.fullName = textField.text
        case 1:
            registrationViewModel.dob = textField.text
        case 2:
            registrationViewModel.gender = textField.text
        case 3:
            registrationViewModel.interestedIn = textField.text
        case 4:
            registrationViewModel.location = textField.text
        default:
            ()
        }
    }
    
    fileprivate func setupTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss)))
    }
    
    @objc fileprivate func handleTapDismiss() {
        self.view.endEditing(true)
    }
    
    fileprivate func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func handleKeyboardShow(notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        let keyboardFrame = value.cgRectValue
        let bottomSpace = keyboardFrame.height - stackTxtFld.frame.origin.y - stackTxtFld.frame.height
        let diff = keyboardFrame.height - bottomSpace
        self.view.transform = CGAffineTransform(translationX: 0, y: -diff/4 - 8)
    }
    
    @objc fileprivate func handleKeyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.transform = .identity
        })
    }
    
    func initialize() {
        imgProfile.layer.cornerRadius = imgProfile.frame.size.width / 2
        imgProfile.clipsToBounds = true
        imgProfile.layer.borderColor = UIColor.white.cgColor
        imgProfile.layer.borderWidth = 2
    }
    
    @IBAction func registerBtnTap(_ sender: Any) {
        self.handleTapDismiss()
        guard let email = fNameTxtFld.text else {return}
        guard let pwd = pwdTxtFld.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: pwd) { (res, err) in
            if let err = err {
                print(err)
                self.showHUDWithError(err)
                return
            }
            
            print("Successfully registered user:",res?.user.uid ?? "")
        }
    }
    
    fileprivate func showHUDWithError(_ error: Error) {
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Failed registration"
        hud.detailTextLabel.text = error.localizedDescription
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 4)
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
            gender = true
            genderAndInterestedIn(title:"Gender", message: "Select your gender")
            return false
        case 3:
            self.view.endEditing(true)
            gender = false
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
        var dateStr: String = ""
        let alert = UIAlertController(title: "Date", message: "Select your date of birth", preferredStyle: self.alertStyle)
        alert.addDatePicker(mode: .date, date: Date(), minimumDate: nil, maximumDate: nil) { date in
            dateStr = date.dateString()
        }
        alert.addAction(title: "Done", style: .cancel, handler: {(alert: UIAlertAction!) in
//            When button done is clicked then perform saving
            self.dobTxtFld.text = dateStr
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func genderAndInterestedIn(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: self.alertStyle)
        let pickerViewValues: [[String]] = [["Male","Female"]]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: 0)
        var selectedVal = 0
        var selectedValText = ""
        
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            selectedVal = index.row
        }
        alert.addAction(title: "Done", style: .cancel, handler: {(alert: UIAlertAction!) in
            if selectedVal == 0 {
                selectedValText = "Male"
            }else {
                selectedValText = "Female"
            }
            if self.gender == true {
                self.genderTxtFld.text = selectedValText
            }else {
                self.interestedInTxtFld.text = selectedValText
            }
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func location() {
        let alert = UIAlertController(style: self.alertStyle)
        alert.addLocalePicker(type: .country) { info in
            Log(info?.currencyCode)
            self.locationTxtFld.text = info?.country
        }
        alert.addAction(title: "Cancel", style: .cancel)
        self.present(alert, animated: true, completion: nil)
    }
}
