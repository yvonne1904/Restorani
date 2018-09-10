////
////  TreciKontroler.swift
////  Restorani preko koda
////
////  Created by Jovana Jovovic on 9/7/18.
////  Copyright © 2018 Jovana Jovovic. All rights reserved.
////
//import UIKit
//
//final class ScheduleAppointmentController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
//
//    private let chooseServiceContainer: UIView = {
//        let view = UIView()
//        view.backgroundColor = .backgroundGray
//        return view
//    }()
//
//    private let chooseServiceLabel: PaddingLabel2 = {
//        let label = PaddingLabel2()
//        label.text = "Choose Service"
//        label.font = AppFontManager.font(size: 15, weight: .regular)
//        label.backgroundColor = .clear
//        label.textColor = .black
//        label.textAlignment = .left
//        return label
//    }()
//
//    private let serviceTextfield: UITextField = {
//        let tv = UITextField()
//        tv.placeholder = "Service"
//        tv.isEnabled = false
//        tv.textAlignment = .left
//        tv.font = AppFontManager.font(size: 15, weight: .regular)
//        tv.backgroundColor = .white
//        tv.layer.cornerRadius = 5
//        tv.clipsToBounds = true
//        return tv
//    }()
//
//
//    private let dateContainer: UIView = {
//        let view = UIView()
//        view.backgroundColor = .backgroundGray
//        return view
//    }()
//
//    private let dateLabel: PaddingLabel2 = {
//        let label = PaddingLabel2()
//        label.text = "Date"
//        label.font = AppFontManager.font(size: 15, weight: .regular)
//        label.backgroundColor = .clear
//        label.textColor = .black
//        label.textAlignment = .left
//        return label
//    }()
//
//    private let dateTextfield: UITextField = {
//        let tv = UITextField()
//        tv.placeholder = "Date"
//        tv.isEnabled = false
//        tv.textAlignment = .left
//        tv.font = AppFontManager.font(size: 15, weight: .regular)
//        tv.backgroundColor = .white
//        tv.layer.cornerRadius = 5
//        tv.clipsToBounds = true
//        return tv
//    }()
//
//    private let startTimeContainer: UIView = {
//        let view = UIView()
//        view.backgroundColor = .backgroundGray
//        return view
//    }()
//
//    private let startLabel: PaddingLabel2 = {
//        let label = PaddingLabel2()
//        label.text = "Start Time"
//        label.font = AppFontManager.font(size: 15, weight: .regular)
//        label.backgroundColor = .clear
//        label.textColor = .black
//        label.textAlignment = .left
//        return label
//    }()
//
//    private let startTimeTextfield: UITextField = {
//        let tv = UITextField()
//        tv.placeholder = "Start Time"
//        tv.isEnabled = false
//        tv.textAlignment = .left
//        tv.font = AppFontManager.font(size: 15, weight: .regular)
//        tv.backgroundColor = .white
//        tv.layer.cornerRadius = 5
//        tv.clipsToBounds = true
//        return tv
//    }()
//
//    private let descriptionContainer: UIView = {
//        let view = UIView()
//        view.backgroundColor = .backgroundGray
//        return view
//    }()
//
//    private let descriptionLabel: PaddingLabel2 = {
//        let label = PaddingLabel2()
//        label.text = "Description"
//        label.font = AppFontManager.font(size: 15, weight: .regular)
//        label.backgroundColor = .clear
//        label.textColor = .black
//        label.textAlignment = .left
//        return label
//    }()
//
//    private let descriptionTextViewContainer: UIView = {
//        let tv = UIView()
//        tv.backgroundColor = .white
//        tv.layer.cornerRadius = 5
//        tv.clipsToBounds = true
//        return tv
//    }()
//
//    private let descriptionTextField: UITextView = {
//        let textView = UITextView()
//        textView.backgroundColor = .white
//        textView.textColor = .lightGray
//        textView.font = AppFontManager.font(size: 14, weight: .regular)
//        textView.isEditable = true
//        textView.text = "Description"
//        textView.autocorrectionType = .no
//
//        return textView
//    }()
//
//    private let bookNowButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Book Now", for: .normal)
//        button.addTarget(self, action: #selector(handleBookNow), for: .touchUpInside)
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.backgroundColor = UIColor.lightBlack
//        button.titleLabel?.font = AppFontManager.font(size: 18, weight: .regular)
//        button.layer.cornerRadius = 5
//        button.clipsToBounds = true
//        return button
//    }()
//
//    @objc private func handleBookNow() {
//        print("Apply")
//    }
//
//    //*******/
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
//    }
//
//    func setupViews() {
//        setupNavBarButtons()
//        view.addSubview(chooseServiceContainer)
//        chooseServiceContainer.addSubview(chooseServiceLabel)
//        chooseServiceContainer.addSubview(serviceTextfield)
//        serviceTextfield.setPadding()
//
//        view.addSubview(dateContainer)
//        dateContainer.addSubview(dateLabel)
//        dateContainer.addSubview(dateTextfield)
//        dateTextfield.setPadding()
//
//        view.addSubview(startTimeContainer)
//        startTimeContainer.addSubview(startLabel)
//        startTimeContainer.addSubview(startTimeTextfield)
//        startTimeTextfield.setPadding()
//        startTimeTextfield.delegate = self
//
//        view.addSubview(descriptionContainer)
//        view.addSubview(descriptionTextViewContainer)
//        descriptionContainer.addSubview(descriptionLabel)
//        descriptionTextViewContainer.addSubview(descriptionTextField)
//        descriptionTextField.delegate = self
//        //        descriptionTextField.setPadding()
//
//        view.addSubview(bookNowButton)
//
//        chooseServiceContainer.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 88)
//
//        chooseServiceLabel.anchor(chooseServiceContainer.topAnchor, left: chooseServiceContainer.leftAnchor, bottom: nil, right: chooseServiceContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 44)
//
//        serviceTextfield.anchor(chooseServiceLabel.bottomAnchor, left: chooseServiceLabel.leftAnchor, bottom: chooseServiceContainer.bottomAnchor, right: chooseServiceContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
//
//        dateContainer.anchor(chooseServiceContainer.bottomAnchor, left: chooseServiceContainer.leftAnchor, bottom: nil, right: chooseServiceContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 88)
//
//        dateLabel.anchor(dateContainer.topAnchor, left: dateContainer.leftAnchor, bottom: nil, right: dateContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 44)
//
//        dateTextfield.anchor(dateLabel.bottomAnchor, left: dateLabel.leftAnchor, bottom: dateContainer.bottomAnchor, right: dateContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
//
//        startTimeContainer.anchor(dateContainer.bottomAnchor, left: dateContainer.leftAnchor, bottom: nil, right: dateContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 88)
//
//        startLabel.anchor(startTimeContainer.topAnchor, left: startTimeContainer.leftAnchor, bottom: nil, right: startTimeContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 44)
//
//        startTimeTextfield.anchor(startLabel.bottomAnchor, left: startLabel.leftAnchor, bottom: startTimeContainer.bottomAnchor, right: startTimeContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
//
//        descriptionContainer.anchor(startTimeContainer.bottomAnchor, left: startTimeContainer.leftAnchor, bottom: nil, right: startTimeContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 120)
//
//        descriptionLabel.anchor(descriptionContainer.topAnchor, left: descriptionContainer.leftAnchor, bottom: nil, right: descriptionContainer.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 44)
//
//        descriptionTextViewContainer.anchor(descriptionLabel.bottomAnchor, left: descriptionLabel.leftAnchor, bottom: descriptionContainer.bottomAnchor, right: descriptionLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//
//        descriptionTextField.anchor(descriptionTextViewContainer.topAnchor, left: descriptionTextViewContainer.leftAnchor, bottom: descriptionTextViewContainer.bottomAnchor, right: descriptionTextViewContainer.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
//
//        bookNowButton.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 12, rightConstant: 12, widthConstant: 0, heightConstant: 44)
//    }
//
//    private func setupNavBarButtons() {
//        view.backgroundColor = .backgroundGray
//        title = "Schedule Appointment"
//        navigationController?.navigationBar.applyNavigationGradient(colors: [UIColor.blueColor , UIColor.purpleColor])
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "lupa", style: .plain, target: self, action: #selector(handleBack))
//        navigationItem.leftBarButtonItem?.image = UIImage(named: "back1")
//        self.navigationController?.navigationBar.tintColor = UIColor.white
//    }
//
//    @objc private func handleBack() {
//        self.transitionForDismiss()
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    //MARK:- UITextField methods
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//
//    //MARK:- UITextView methods
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if(text == "\n") {
//            view.endEditing(true)
//            return false
//        }
//        else {
//            return true
//        }
//    }
//
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//
//        if textView.textColor == .lightGray {
//            textView.text = nil
//            textView.textColor = .black
//        }
//    }
//    func textViewDidEndEditing(_ textView: UITextView) {
//
//        if textView.text.isEmpty {
//            textView.text = "Description"
//            textView.textColor = .lightGray
//            textView.resignFirstResponder()
//        }
//    }
//}
//
//extension ScheduleAppointmentController {
//
//}
