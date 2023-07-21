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
