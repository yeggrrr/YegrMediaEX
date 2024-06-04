//
//  HomeViewController.swift
//  YegrMediaEX
//
//  Created by YJ on 6/4/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
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
        let safeArea = view.safeAreaLayoutGuide
        let buttonRatio: Double = 0.9 / 2
        
        mainPosterImageView.snp.makeConstraints {
            $0.top.equalTo(safeArea)
            $0.leading.trailing.equalTo(safeArea).inset(10)
            $0.height.equalTo(450)
        }
        
        playButton.snp.makeConstraints {
            $0.leading.equalTo(mainPosterImageView.snp.leading).offset(10)
            $0.bottom.equalTo(mainPosterImageView.snp.bottom).offset(-10)
            $0.height.equalTo(40)
            $0.width.equalTo(mainPosterImageView.snp.width).multipliedBy(buttonRatio)
        }
        
        addWishListButton.snp.makeConstraints {
            $0.trailing.equalTo(mainPosterImageView.snp.trailing).offset(-10)
            $0.bottom.equalTo(mainPosterImageView.snp.bottom).offset(-10)
            $0.height.equalTo(40)
            $0.width.equalTo(mainPosterImageView.snp.width).multipliedBy(buttonRatio)
        }
        
        genreLabel.snp.makeConstraints {
            $0.leading.equalTo(mainPosterImageView.snp.leading).offset(10)
            $0.trailing.equalTo(mainPosterImageView.snp.trailing).offset(-10)
            $0.bottom.equalTo(playButton.snp.top).offset(-10)
        }
        
        hotContentsLabel.snp.makeConstraints {
            $0.leading.equalTo(safeArea).offset(15)
            $0.top.equalTo(mainPosterImageView.snp.bottom).offset(10)
        }
        
        bottomImageStackView.snp.makeConstraints {
            $0.top.equalTo(hotContentsLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(safeArea).inset(10)
            $0.bottom.equalTo(safeArea).offset(-10)
        }
        
        leftTop10ImageView.snp.makeConstraints {
            $0.top.equalTo(leftImageView.snp.top)
            $0.trailing.equalTo(leftImageView.snp.trailing)
            $0.width.equalTo(30)
            $0.height.equalTo(leftTop10ImageView.snp.width).multipliedBy(1.5)
        }
        
        centerTop10ImageView.snp.makeConstraints {
            $0.top.equalTo(centerImageView.snp.top)
            $0.trailing.equalTo(centerImageView.snp.trailing)
            $0.width.equalTo(30)
            $0.height.equalTo(leftTop10ImageView.snp.width).multipliedBy(1.5)
        }
        
        rightTop10ImageView.snp.makeConstraints {
            $0.top.equalTo(rightImageView.snp.top)
            $0.trailing.equalTo(rightImageView.snp.trailing)
            $0.width.equalTo(30)
            $0.height.equalTo(leftTop10ImageView.snp.width).multipliedBy(1.5)
        }
        
        leftNBadgeImageView.snp.makeConstraints {
            $0.top.equalTo(leftImageView.snp.top).offset(5)
            $0.leading.equalTo(leftImageView.snp.leading).offset(5)
        }
        
        centerNBadgeImageView.snp.makeConstraints {
            $0.top.equalTo(centerImageView.snp.top).offset(5)
            $0.leading.equalTo(centerImageView.snp.leading).offset(5)
        }
        
        rightNBadgeImageView.snp.makeConstraints {
            $0.top.equalTo(rightImageView.snp.top).offset(5)
            $0.leading.equalTo(rightImageView.snp.leading).offset(5)
        }
    }
    
    func configureUI() {
        // container view
        view.backgroundColor = .black
        
        // navigationbar
        let left = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutBarButtonClicked))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = left
        navigationController?.navigationBar.topItem?.leftBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.topItem?.title = "YEGR님"
        
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
        [leftImageView, centerImageView, rightImageView].forEach {
            $0.backgroundColor = .systemGray
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
        
        // left, center, rightTop10ImageView
        [leftTop10ImageView, centerTop10ImageView, rightTop10ImageView].forEach {
            $0.image = UIImage(named: "top10 badge")
        }
        
        // left, center, rightNBadgeImageView
        [leftNBadgeImageView, centerNBadgeImageView, rightNBadgeImageView].forEach {
            $0.image = UIImage(named: "single-large")
        }
    }
    
    @objc func logoutBarButtonClicked() {
        dismiss(animated: true)
    }
}
