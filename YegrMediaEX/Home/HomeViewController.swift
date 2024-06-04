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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationItem.title = "YEGR님"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
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
    }
    
    func configureUI() {
        // navigation
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
