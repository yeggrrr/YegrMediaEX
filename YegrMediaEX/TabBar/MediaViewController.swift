//
//  MediaViewController.swift
//  YegrMediaEX
//
//  Created by YJ on 6/4/24.
//

import UIKit

class MediaViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        tabBar.tintColor = .systemPink
        tabBar.backgroundColor = .darkGray
        tabBar.unselectedItemTintColor = .white
        
        let firstVC = UINavigationController(rootViewController: HomeViewController())
        firstVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let secondVC = UIViewController()
        secondVC.tabBarItem = UITabBarItem(
            title: "New & Hot",
            image: UIImage(systemName: "play.rectangle.on.rectangle"),
            selectedImage: UIImage(systemName: "play.rectangle.on.rectangle.fill")
        )
        
        let thirdVC = UIViewController()
        thirdVC.tabBarItem = UITabBarItem(
            title: "저장한 콘텐츠 목록",
            image: UIImage(systemName: "square.and.arrow.down"),
            selectedImage: UIImage(systemName: "square.and.arrow.down.fill")
        )
        
        self.viewControllers = [firstVC, secondVC, thirdVC]
    }
}
