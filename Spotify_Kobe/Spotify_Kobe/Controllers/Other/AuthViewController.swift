//
//  AuthViewController.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/07/09.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {

	private let webView: WKWebView = {
		let webPagePreferences = WKWebpagePreferences()
		webPagePreferences.allowsContentJavaScript = true
		let webViewConfiguration = WKWebViewConfiguration()
		webViewConfiguration.defaultWebpagePreferences = webPagePreferences
		let webView = WKWebView(frame: .zero,
								configuration: webViewConfiguration)
		return webView
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
		view.backgroundColor = .systemBackground
		webView.navigationDelegate = self
		view.addSubview(webView)
    }
	
	// MARK: - viewDidLayoutSubviews
	/// 뷰가 방금 하위 뷰를 배치했음을 뷰 컨트롤러에 알리기 위해 호출됩니다.
	/// 뷰 컨트롤러의 뷰에 대한 범위가 변경되면 뷰는 하위 뷰의 위치를 조정한 다음 시스템에서 이 메서드를 호출합니다.
	/// 참고 문서 : https://developer.apple.com/documentation/uikit/uiviewcontroller/1621398-viewdidlayoutsubviews
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		webView.frame = view.bounds
	}

}
