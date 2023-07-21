//
//  AuthManager.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/07/09.
//

import Foundation

final class AuthManager {
	static let shared = AuthManager()
	
	private init() {}
	
	public var signInURL: URL? {
		let scopes = AuthManagerNameSpace.scopes.localized
		let redirectURI = AuthManagerNameSpace.redirectURI.localized
		let base = AuthManagerNameSpace.base.localized
		let signInURL = AuthManagerNameSpace.signInURL.localized
		return URL(string: signInURL)
	}
	
	var isSignedIn: Bool {
		return false
	}
	
	private var accessToken: String? {
		return nil
	}
	
	private var refreshToken: String? {
		return nil
	}
	
	private var tokenExpirationDate: Date? {
		return nil
	}
	
	private var shouldRefreshToken: Bool {
		return false
	}
}

struct Constants {
	static let clientID = Client.id.token
	static let clientSecret = Client.secret.token
}

enum Client {
	case id
	case secret
	
	var token: String {
		switch self {
		case .id:
			return "6c41cd64cd924e2a91dca90d70a358bd"
		case .secret:
			return "eb70a866319847b8b4335c16b1954e17"
		}
	}
}

enum AuthManagerNameSpace {
	case scopes
	case redirectURI
	case base
	case signInURL
	
	var localized: String {
		switch self {
		case .scopes:
			return "user-read-private"
		case .redirectURI:
			return "https://github.com/devKobe24/Spotify_Clone"
		case .base:
			return "https://accounts.spotify.com/authorize"
		case .signInURL:
			return "\(AuthManagerNameSpace.base.localized)?response_type=code&client_id=\(Client.id.token)&scope=\(AuthManagerNameSpace.scopes.localized)&redirect_uri=\(AuthManagerNameSpace.redirectURI.localized)&show_dialog=TRUE"
		}
	}
}
