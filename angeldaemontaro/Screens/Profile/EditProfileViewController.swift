//
//  EditProfileViewController.swift
//  angeldaemontaro
//
//  Created by Aliaksandr Laptseu on 20.05.23.
//

import UIKit
import AvatarImagePicker

class EditProfileViewController: UIViewController {
    let borderWirthFields = 1.0
    let cornerRadiusFields = 10.0
    var toolbackPicker: UIToolbar?
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.clipsToBounds = true
            photoImageView.layer.cornerRadius = photoImageView.bounds.height / 2
            photoImageView.layer.borderWidth = 3
            photoImageView.layer.borderColor = traitCollection.userInterfaceStyle == .dark ?
            UIColor.white.cgColor : UIColor.black.cgColor
        }
    }
    @IBOutlet weak var editPhotoButton: UIButton! {
        didSet {
            editPhotoButton.setTitle("", for: .normal)
            editPhotoButton.setImage(Assets.Images.loadImageButton.image, for: .normal)
            editPhotoButton.clipsToBounds = true
            editPhotoButton.layer.cornerRadius = editPhotoButton.bounds.height / 2
        }
    }
    @IBOutlet weak var firstNameLabel: UILabel! {
        didSet {
            firstNameLabel.font = UIFont.systemFont(ofSize: 20)
            firstNameLabel.text = getLocale(key: "firstname_profile")
        }
    }
    @IBOutlet weak var firstNameTextField: UITextField! {
        didSet {
            firstNameTextField.font = UIFont.systemFont(ofSize: 20)
            firstNameTextField.clipsToBounds = true
            firstNameTextField.layer.cornerRadius = cornerRadiusFields
            firstNameTextField.layer.borderWidth = borderWirthFields
        }
    }
    @IBOutlet weak var lastNameLabel: UILabel! {
        didSet {
            lastNameLabel.font = UIFont.systemFont(ofSize: 20)
            lastNameLabel.text = getLocale(key: "lastname_profile")
        }
    }
    @IBOutlet weak var lastNameTextField: UITextField! {
        didSet {
            lastNameTextField.font = UIFont.systemFont(ofSize: 20)
            lastNameTextField.clipsToBounds = true
            lastNameTextField.layer.cornerRadius = cornerRadiusFields
            lastNameTextField.layer.borderWidth = borderWirthFields
        }
    }
    @IBOutlet weak var bithdayLabel: UILabel! {
        didSet {
            bithdayLabel.font = UIFont.systemFont(ofSize: 20)
            bithdayLabel.text = getLocale(key: "bith_profile")
        }
    }
    @IBOutlet weak var bithdayTextField: UITextField! {
        didSet {
            bithdayTextField.font = UIFont.systemFont(ofSize: 20)
            bithdayTextField.clipsToBounds = true
            bithdayTextField.layer.cornerRadius = cornerRadiusFields
            bithdayTextField.layer.borderWidth = borderWirthFields
        }
    }
    @IBOutlet weak var aboutLabel: UILabel! {
        didSet {
            aboutLabel.font = UIFont.systemFont(ofSize: 20)
            aboutLabel.text = getLocale(key: "about_profile")
        }
    }
    @IBOutlet weak var aboutTextView: UITextView! {
        didSet {
            aboutTextView.font = UIFont.systemFont(ofSize: 20)
            aboutTextView.clipsToBounds = true
            aboutTextView.layer.cornerRadius = cornerRadiusFields
            aboutTextView.layer.borderWidth = borderWirthFields
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let datePicker = UIDatePicker()
    
    var saveImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        setupNavTitle(text: "Edit Profile")
        setupNavBackButton(complete: #selector(backClick))
        
        let editButton = UIBarButtonItem(title: getLocale(key: "save_nav_button"),
                                         style: .plain, target: self, action: #selector(saveClick))
        self.navigationItem.rightBarButtonItems = [editButton]
        
        updateTheme()
        createDatePicker()
        
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        bithdayTextField.delegate = self
        
        aboutTextView.translatesAutoresizingMaskIntoConstraints = true
        aboutTextView.sizeToFit()
        aboutTextView.isScrollEnabled = false
        aboutTextView.delegate = self
        
        loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logScreen(screenName: "EditProfile", screenClass: String(describing: self))
    }
    
    func loadData() {
        if let image = ProfileSave.image {
            photoImageView.image = UIImage(data: image)
            saveImage = photoImageView.image
        } else {
            photoImageView.image = Assets.Images.emptyProfile.image
            saveImage = photoImageView.image
        }
        
        if let firstName = ProfileSave.firstName {
            firstNameTextField.text = firstName
        } else {
            firstNameTextField.text = "Name"
        }
        
        if let lastName = ProfileSave.lastName {
            lastNameTextField.text = lastName
        } else {
            lastNameTextField.text = "LastName"
        }
        
        if let dateBith = ProfileSave.dateBith {
            datePicker.date = dateBith
        } else {
            datePicker.date = Date()
        }
        let formated = DateFormatter()
        formated.dateStyle = .medium
        formated.timeStyle = .none
        bithdayTextField.text = formated.string(from: datePicker.date)

        if let about = ProfileSave.about {
            aboutTextView.text = about
        } else {
            aboutTextView.text = "About"
        }
    }
    
    @objc
    func saveClick() {
        ProfileSave.image = saveImage?.jpegData(compressionQuality: 0)
        ProfileSave.firstName = firstNameTextField.text
        ProfileSave.lastName = lastNameTextField.text
        ProfileSave.dateBith = datePicker.date
        ProfileSave.about = aboutTextView.text
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func backClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Update Theme
    private func updateTheme() {
        let isDark = traitCollection.userInterfaceStyle == .dark
        
        let colorWhite = isDark ? UIColor.white : UIColor.black
        let colorDark = isDark ? UIColor.black : UIColor.white
        
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: colorWhite,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold)
        ]
        
        navigationItem.backBarButtonItem?.tintColor = colorWhite
        navigationItem.leftBarButtonItems?[0].tintColor = colorWhite
        navigationItem.rightBarButtonItems?[0].tintColor = colorWhite
        
        let colorLabel = colorWhite.withAlphaComponent(0.6)
        firstNameLabel.textColor = colorLabel
        firstNameTextField.textColor = colorWhite
        lastNameLabel.textColor = colorLabel
        lastNameTextField.textColor = colorWhite
        bithdayLabel.textColor = colorLabel
        bithdayTextField.textColor = colorWhite
        aboutLabel.textColor = colorLabel
        aboutTextView.backgroundColor = colorDark
        aboutTextView.textColor = colorWhite
        
        editPhotoButton.backgroundColor = colorDark
        firstNameTextField.tintColor = colorWhite
        lastNameTextField.tintColor = colorWhite
        bithdayTextField.tintColor = colorWhite
        aboutTextView.tintColor = colorWhite
        toolbackPicker?.tintColor = colorDark
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    func createDatePicker() {
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        
        toolbackPicker = UIToolbar()
        guard let toolbar = toolbackPicker else  { return }
        
        toolbar.sizeToFit()
        toolbar.tintColor = .black
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelPressed))
        toolbar.setItems([cancelBtn, spaceButton, doneBtn], animated: true)
        
        bithdayTextField.inputAccessoryView = toolbar
        
        bithdayTextField.inputView = datePicker
        
    }
    
    @IBAction func onPhotoClick(_ sender: Any) {
        let picker = AvatarImagePicker.instance
        // optional: custom properties
        picker.dismissAnimated = false // default is true
        picker.sourceTypes = [.camera, .photoLibrary] // default is [.camera, .photoLibrary]
        picker.presentStyle = .overFullScreen // default is .fullScreen
        picker.present(allowsEditing: true, selected: { [weak self] (image) in
            guard let self = self else { return }
            self.photoImageView.image = image
            self.saveImage = image
            // selected image
        }) {
            // tapped cancel
        }
        
//        ImagePickerManager().pickImage(self) { image in
//            self.photoImageView.image = image
//            self.saveImage = image
//        }
    }
    @IBAction func textFieldDidChange(_ sender: Any) {
        
    }
    
    @objc
    func cancelPressed() {
        self.view.endEditing(true)
    }
    
    @objc
    func donePressed() {
        let formated = DateFormatter()
        formated.dateStyle = .medium
        formated.timeStyle = .none
        
        bithdayTextField.text = formated.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

extension EditProfileViewController: UITextFieldDelegate, UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
          let fixedWidth = textView.frame.size.width
          textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
          let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
          var newFrame = textView.frame
          newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
          textView.frame = newFrame
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func hideKeyboardTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
