//
//  UILabel+.swift
//  YegrMediaEX
//
//  Created by YJ on 6/4/24.
//

import UIKit

extension UILabel {
    func setUI(_ title: String, _ alignment: NSTextAlignment) {
        text = title
        font = .boldSystemFont(ofSize: 17)
        textColor = .white
        textAlignment = alignment
    }
    
    func setCustomUI(_ title: String, textColorStyle: UIColor, _ alignment: NSTextAlignment) {
        text = title
        font = .boldSystemFont(ofSize: 17)
        textColor = textColorStyle
        textAlignment = alignment
    }
}
