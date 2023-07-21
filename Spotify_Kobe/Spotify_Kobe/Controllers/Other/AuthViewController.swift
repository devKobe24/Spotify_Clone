//
//  AuthViewController.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/07/09.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {

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
    }

}
