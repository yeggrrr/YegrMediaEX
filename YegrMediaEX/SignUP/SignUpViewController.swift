//
//  SignUpViewController.swift
//  YegrMediaEX
//
//  Created by YJ on 6/4/24.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    let logoLabel = UILabel()
    let emailPhoneNumberTextField = UITextField()
    let passwordTextField = UITextField()
    let nicknameTextField = UITextField()
    let locationTextField = UITextField()
    let recommendCodeTextField = UITextField()
    let signUpButton = UIButton()
    
    let additionalInfoStackView = UIStackView()
    let additionalInfoLabel = UILabel()
    let onOffSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurHierarchy()
        configureLayout()
        configureUI()
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    func configurHierarchy() {
        view.addSubview(logoLabel)
        
        view.addSubview(emailPhoneNumberTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(recommendCodeTextField)
        view.addSubview(signUpButton)
        view.addSubview(additionalInfoStackView)
        additionalInfoStackView.addArrangedSubview(additionalInfoLabel)
        additionalInfoStackView.addArrangedSubview(onOffSwitch)
    }
    
    func configureLayout() {
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        emailPhoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(100)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailPhoneNumberTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        locationTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        recommendCodeTextField.snp.makeConstraints {
            $0.top.equalTo(locationTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(recommendCodeTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(50)
        }
        
        additionalInfoStackView.snp.makeConstraints {
            $0.top.equalTo(signUpButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(40)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        logoLabel.text = "YEGRFLIX"
        logoLabel.font = .systemFont(ofSize: 35, weight: .black)
        logoLabel.textColor = .systemRed
        logoLabel.textAlignment = .center
        
        emailPhoneNumberTextField.setCustomUI("이메일 주소 또는 전화번호", isSecureText: false, .emailAddress)
        passwordTextField.setCustomUI("비밀번호", isSecureText: true, .default)
        nicknameTextField.setCustomUI("닉네임", isSecureText: false, .default)
        locationTextField.setCustomUI("위치", isSecureText: false, .default)
        recommendCodeTextField.setCustomUI("추천 코드", isSecureText: false, .numberPad)
        
        signUpButton.signUpStyle()
        
        additionalInfoStackView.axis = .horizontal
        additionalInfoStackView.distribution = .fill
        
        additionalInfoLabel.setCustomUI("추가 정보 입력", textColorStyle: .white, .left)
        
        onOffSwitch.isOn = true
        onOffSwitch.onTintColor = .systemRed
    }
    
    @objc func signUpButtonClicked() {
        
    }
}

extension UITextField {
    func setCustomUI(_ placeholderText: String, isSecureText: Bool, _ keyboardStyle: UIKeyboardType) {
        attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        backgroundColor = .darkGray
        textColor = .white
        keyboardType = keyboardStyle
        isSecureTextEntry = isSecureText
        returnKeyType = .done
        keyboardAppearance = .dark
        layer.cornerRadius = 5
        leftPadding()
    }
    
    func leftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

extension UIButton {
    func signUpStyle() {
        setTitle("회원가입", for: .normal)
        setTitle("회원가입", for: .highlighted)
        setTitleColor(.black, for: .normal)
        setTitleColor(.darkGray, for: .highlighted)
        configuration?.titleAlignment = .center
        backgroundColor = .white
        layer.cornerRadius = 8
    }
}

extension UILabel {
    func setCustomUI(_ title: String, textColorStyle: UIColor, _ alignment: NSTextAlignment) {
        text = title
        textColor = textColorStyle
        textAlignment = alignment
        font = .boldSystemFont(ofSize: 17)
    }
}
