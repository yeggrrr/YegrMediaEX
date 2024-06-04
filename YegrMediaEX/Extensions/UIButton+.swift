//
//  UIButton+.swift
//  YegrMediaEX
//
//  Created by YJ on 6/4/24.
//

import UIKit

extension UIButton {
    func setUI(_ backgroundColorStyle: UIColor, _ tintColorStyle: UIColor, _ imageName: String, _ title: String) {
        backgroundColor = backgroundColorStyle
        setImage(UIImage(systemName: imageName), for: .normal)
        setTitle(title, for: .normal)
        tintColor = tintColorStyle
        layer.cornerRadius = 5
    }
    
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
