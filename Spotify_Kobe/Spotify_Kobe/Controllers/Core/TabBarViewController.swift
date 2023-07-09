//
//  TabBarViewController.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/07/09.
//

import UIKit

class TabBarViewController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let homeViewController = HomeViewController()
		let searchViewController = SearchViewController()
		let libraryViewController = LibraryViewController()
		
		homeViewController.title = "Home"
		searchViewController.title = "Search"
		libraryViewController.title = "Library"
		
		homeViewController.navigationItem.largeTitleDisplayMode = .always
		searchViewController.navigationItem.largeTitleDisplayMode = .always
		libraryViewController.navigationItem.largeTitleDisplayMode = .always
		
		let homeNavigationController = UINavigationController(rootViewController: homeViewController)
		let searchNavigationController = UINavigationController(rootViewController: searchViewController)
		let libraryNavigationController = UINavigationController(rootViewController: libraryViewController)
		
		homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
		searchNavigationController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
		libraryNavigationController.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
		
		homeNavigationController.navigationBar.prefersLargeTitles = true
		searchNavigationController.navigationBar.prefersLargeTitles = true
		libraryNavigationController.navigationBar.prefersLargeTitles = true
		
		setViewControllers([homeNavigationController, searchNavigationController, libraryNavigationController], animated: false)
	}
}
