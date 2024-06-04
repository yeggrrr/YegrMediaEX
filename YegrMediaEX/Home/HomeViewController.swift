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
    }
    
    func configureLayout() {
        mainPosterImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(300)
    
        }
    }
    
    func configureUI() {
        let left = UIBarButtonItem(title: "로그아웃", style: .plain, target: self, action: #selector(logoutBarButtonClicked))
        navigationItem.leftBarButtonItem = left
        navigationItem.leftBarButtonItem?.tintColor = .white
        mainPosterImageView.backgroundColor = .systemGray
    }
    
    @objc func logoutBarButtonClicked() {
        dismiss(animated: true)
    }
}
