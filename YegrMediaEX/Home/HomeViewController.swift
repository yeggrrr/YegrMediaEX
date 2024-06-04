//
//  HomeViewController.swift
//  YegrMediaEX
//
//  Created by YJ on 6/4/24.
//

import UIKit
import SnapKit

class HomeViewController: UITabBarController {
    let mainPosterImageView = UIImageView()
    let genreLabel = UILabel()
    let playButton = UIButton(type: .system)
    let addWishListButton = UIButton(type: .system)
    let hotContentsLabel = UILabel()
    
    let bottomImageStackView = UIStackView()
    let leftImageView = UIImageView()
    let centerImageView = UIImageView()
    let rightImageView = UIImageView()
    
    let leftTop10ImageView = UIImageView()
    let centerTop10ImageView = UIImageView()
    let rightTop10ImageView = UIImageView()
    
    let leftNBadgeImageView = UIImageView()
    let centerNBadgeImageView = UIImageView()
    let rightNBadgeImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configurHierarchy() {
        view.addSubview(mainPosterImageView)
        mainPosterImageView.addSubview(playButton)
        mainPosterImageView.addSubview(addWishListButton)
        mainPosterImageView.addSubview(genreLabel)
        view.addSubview(hotContentsLabel)
        view.addSubview(bottomImageStackView)
        bottomImageStackView.addArrangedSubview(leftImageView)
        bottomImageStackView.addArrangedSubview(centerImageView)
        bottomImageStackView.addArrangedSubview(rightImageView)
        
        leftImageView.addSubview(leftTop10ImageView)
        centerImageView.addSubview(centerTop10ImageView)
        rightImageView.addSubview(rightTop10ImageView)
        
        leftImageView.addSubview(leftNBadgeImageView)
        centerImageView.addSubview(centerNBadgeImageView)
        rightImageView.addSubview(rightNBadgeImageView)
        
    }
    
    func configureLayout() {
        mainPosterImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(450)
        }
        
        playButton.snp.makeConstraints {
            $0.leading.equalTo(mainPosterImageView.snp.leading).offset(10)
            $0.bottom.equalTo(mainPosterImageView.snp.bottom).offset(-10)
            $0.height.equalTo(40)
            $0.width.equalTo(mainPosterImageView.snp.width).multipliedBy(0.9/2.0)
        }
        
        addWishListButton.snp.makeConstraints {
            $0.trailing.equalTo(mainPosterImageView.snp.trailing).offset(-10)
            $0.bottom.equalTo(mainPosterImageView.snp.bottom).offset(-10)
            $0.height.equalTo(40)
            $0.width.equalTo(mainPosterImageView.snp.width).multipliedBy(0.9/2.0)
        }
        
        genreLabel.snp.makeConstraints {
            $0.leading.equalTo(mainPosterImageView.snp.leading).offset(10)
            $0.trailing.equalTo(mainPosterImageView.snp.trailing).offset(-10)
            $0.bottom.equalTo(playButton.snp.top).offset(-10)
        }
        
        hotContentsLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.top.equalTo(mainPosterImageView.snp.bottom).offset(10)
        }
        
        bottomImageStackView.snp.makeConstraints {
            $0.top.equalTo(hotContentsLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
        
        leftTop10ImageView.snp.makeConstraints {
            $0.top.equalTo(leftImageView.snp.top)
            $0.trailing.equalTo(leftImageView.snp.trailing)
            $0.width.equalTo(leftImageView.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(leftImageView.snp.height).multipliedBy(0.9/3.0)
        }
        
        centerTop10ImageView.snp.makeConstraints {
            $0.top.equalTo(centerImageView.snp.top)
            $0.trailing.equalTo(centerImageView.snp.trailing)
            $0.width.equalTo(centerImageView.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(centerImageView.snp.height).multipliedBy(0.9/3.0)
        }
        
        rightTop10ImageView.snp.makeConstraints {
            $0.top.equalTo(rightImageView.snp.top)
            $0.trailing.equalTo(rightImageView.snp.trailing)
            $0.width.equalTo(rightImageView.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(rightImageView.snp.height).multipliedBy(0.9/3.0)
        }
        
        leftNBadgeImageView.snp.makeConstraints {
            $0.top.equalTo(leftImageView.snp.top)
            $0.leading.equalTo(leftImageView.snp.leading)
            $0.width.equalTo(leftImageView.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(leftImageView.snp.height).multipliedBy(0.9/3.0)
        }
        
        centerNBadgeImageView.snp.makeConstraints {
            $0.top.equalTo(centerImageView.snp.top)
            $0.leading.equalTo(centerImageView.snp.leading)
            $0.width.equalTo(centerImageView.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(centerImageView.snp.height).multipliedBy(0.9/3.0)
        }
        
        rightNBadgeImageView.snp.makeConstraints {
            $0.top.equalTo(rightImageView.snp.top)
            $0.leading.equalTo(rightImageView.snp.leading)
            $0.width.equalTo(rightImageView.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(rightImageView.snp.height).multipliedBy(0.9/3.0)
        }
        
        
    }
    
    func configureUI() {
        // navigationUI
        view.backgroundColor = .black
        navigationItem.title = "YEGR님"
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        
        let left = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutBarButtonClicked))
        navigationItem.leftBarButtonItem = left
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        // mainPosterImageView
        mainPosterImageView.backgroundColor = .systemGray
        mainPosterImageView.layer.cornerRadius = 10
        
        // playButton
        playButton.setUI(.white, .black, "play.fill", "   재생")
        
        // addWishListButton
        addWishListButton.setUI(.darkGray, .white, "plus", " 내가 찜한 리스트")
        
        // hotContentsLabel
        genreLabel.setUI("응원하고픈 ・ 흥미진진 ・ 사극 ・ 전투 ・ 한국 작품", .center)
        
        // hotContentsLabel
        hotContentsLabel.setUI("지금 뜨는 콘텐츠", .left)
        
        // bottomImageStackView
        bottomImageStackView.axis = .horizontal
        bottomImageStackView.distribution = .fillEqually
        bottomImageStackView.spacing = 5
        
        // left, center, rightImageView
        leftImageView.backgroundColor = .systemGray
        leftImageView.layer.cornerRadius = 10
        centerImageView.backgroundColor = .systemGray
        centerImageView.layer.cornerRadius = 10
        rightImageView.backgroundColor = .systemGray
        rightImageView.layer.cornerRadius = 10
        
        // left, center, rightTop10ImageView
        leftTop10ImageView.image = UIImage(named: "top10 badge")
        centerTop10ImageView.image = UIImage(named: "top10 badge")
        rightTop10ImageView.image = UIImage(named: "top10 badge")
        
        // left, center, rightNBadgeImageView
        leftNBadgeImageView.backgroundColor = .white
        centerNBadgeImageView.backgroundColor = .white
        rightNBadgeImageView.backgroundColor = .white
    }
    
    @objc func logoutBarButtonClicked() {
        dismiss(animated: true)
    }
}

extension UIImageView {
    func setUI(_ imageName: String , cornerRadius: CGFloat) {
        image = UIImage(named: imageName)
        layer.cornerRadius = cornerRadius
        contentMode = .scaleAspectFill
    }
    
    func setBadgeUI(_ badgeName: String, hidden: Bool) {
        image = UIImage(named: badgeName)
        contentMode = .scaleToFill
        isHidden = hidden
    }
}

extension UIButton {
    func setUI(_ backgroundColorStyle: UIColor, _ tintColorStyle: UIColor, _ imageName: String, _ title: String) {
        backgroundColor = backgroundColorStyle
        setImage(UIImage(systemName: imageName), for: .normal)
        setTitle(title, for: .normal)
        tintColor = tintColorStyle
        layer.cornerRadius = 5
    }
}

extension UILabel {
    func setUI(_ title: String, _ alignment: NSTextAlignment) {
        text = title
        font = .boldSystemFont(ofSize: 17)
        textColor = .white
        textAlignment = alignment
    }
}
