//
//  UIImageView+.swift
//  YegrMediaEX
//
//  Created by YJ on 6/4/24.
//

import UIKit

extension UIImageView {
    func setUI(_ imageName: String , cornerRadius: CGFloat) {
        image = UIImage(named: imageName)
        contentMode = .scaleAspectFill
        layer.cornerRadius = cornerRadius
    }
    
    func setBadgeUI(_ badgeName: String, hidden: Bool) {
        image = UIImage(named: badgeName)
        contentMode = .scaleToFill
        isHidden = hidden
    }
}
