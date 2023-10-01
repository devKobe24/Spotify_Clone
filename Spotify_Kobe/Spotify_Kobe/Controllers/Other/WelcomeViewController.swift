//
//  WelcomeViewController.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/07/09.
//

import UIKit

class WelcomeViewController: UIViewController {
	
	private let signInButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .white
		button.setTitle("Sign In with Spotify", for: .normal)
		button.setTitleColor(.black, for: .normal)
		return button
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Spotify"
		self.view.backgroundColor = .systemGreen
		view.addSubview(signInButton)
		signInButton.addTarget(self, action: #selector(didTapSingInButton), for: .touchUpInside)
    }
	
	// MARK: - viewDidLayoutSubviews
	/// 뷰가 방금 하위 뷰를 배치했음을 뷰 컨트롤러에 알리기 위해 호출됩니다.
	/// 뷰 컨트롤러의 뷰에 대한 범위가 변경되면 뷰는 하위 뷰의 위치를 조정한 다음 시스템에서 이 메서드를 호출합니다.
	/// 참고 문서 : https://developer.apple.com/documentation/uikit/uiviewcontroller/1621398-viewdidlayoutsubviews
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		signInButton.frame = CGRect(
			x: 20,
			y: view.height-50-view.safeAreaInsets.bottom,
			width: view.width-40,
			height: 50
		)
	}
	
	@objc func didTapSingInButton() {
		let authViewController = AuthViewController()
		authViewController.completionHandler = { [weak self] success in
			DispatchQueue.main.async {
				self?.handleSignIn(success: success)
			}
		}
		authViewController.navigationItem.largeTitleDisplayMode = .never
		navigationController?.pushViewController(authViewController, animated: true)
	}
	
	private func handleSignIn(success: Bool) {
		// Log user in or alert error
        guard success else {
            let alert = UIAlertController(
                title: "Oops",
                message: "Something went wrong when signing in.",
                preferredStyle: .alert
            )
            
            let action = UIAlertAction(
                title: "Dismiss",
                style: .cancel,
                handler: nil
            )
            
            alert.addAction(action)
            
            present(alert, animated: true)
            
            return
        }
        
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
	}

}
