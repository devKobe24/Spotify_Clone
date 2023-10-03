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
        //		let scopes = AuthManagerNameSpace.scopes.localized
        //		let redirectURI = AuthManagerNameSpace.redirectURI.localized
        //		let base = AuthManagerNameSpace.base.localized
        let signInURL = AuthManagerNameSpace.signInURL.localized
        return URL(string: signInURL)
    }
    
    var isSignedIn: Bool {
        return accessToken != nil
    }
    
    private var accessToken: String? {
        return UserDefaults.standard.string(forKey: "accessToken")
    }
    
    private var refreshToken: String? {
        return UserDefaults.standard.string(forKey: "refreshToken")
    }
    
    private var tokenExpirationDate: Date? {
        return UserDefaults.standard.object(forKey: "expirationDate") as? Date
    }
    
    private var shouldRefreshToken: Bool {
        guard let expirationDate = tokenExpirationDate else {
            return false
        }
        
        let currentDate = Date()
        let fiveMinutes: TimeInterval = 300
        
        return currentDate.addingTimeInterval(fiveMinutes) >= expirationDate
    }
    
    public func requestAuthorization() {
        var clientId = ENV.CLIENT_ID_TOKEN
        var clientSecret = ENV.CLIENT_SECRET_TOKEN
    }
    
    public func exchangeCodeForToken(
        code: String,
        completion: @escaping ((Bool) -> Void)
    ) {
        // Get Token
        
        guard let url = URL(string: Urls.tokenAPI.value) else {
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(
                name: "grant_type",
                value: "authorization_code"
            ),
            URLQueryItem(
                name: "code",
                value: code
            ),
            URLQueryItem(
                name: "redirect_uri",
                value: AuthManagerNameSpace.redirectURI.localized
            )
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.POST.value
        request.setValue(
            "application/x-www-form-urlencoded",
            forHTTPHeaderField: "Content-Type"
        )
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = ENV.CLIENT_ID_TOKEN+":"+ENV.CLIENT_SECRET_TOKEN
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Failure to get base64")
            completion(false)
            return
        }
        
        request.setValue(
            "Basic \(base64String)",
            forHTTPHeaderField: "Authorization"
        )
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,
                  error == nil else {
                completion(false)
                return
            }
            
            let successRange = 200..<300
            
            guard let httpStatustCode = response as? HTTPURLResponse,
                  successRange.contains(httpStatustCode.statusCode)
            else {
                return
            }
            
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print("SUCCESS: \(json)")
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
        }
        task.resume()
    }
    
    public func refreshIfNeeded(completion: @escaping (Bool) -> Void) {
//        guard shouldRefreshToken else {
//            completion(true)
//            return
//        }
        
        guard let refreshToken = self.refreshToken else {
            return
        }
        
        // Refresh the token
        guard let url = URL(string: Urls.tokenAPI.value) else {
            return
        }
        
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(
                name: "grant_type",
                value: "refresh_token"
            ),
            URLQueryItem(
                name: "refresh_token",
                value: refreshToken
            )
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(
            "application/x-www-form-urlencoded",
            forHTTPHeaderField: "Content-Type"
        )
        request.httpBody = components.query?.data(using: .utf8)
        
        let basicToken = ENV.CLIENT_ID_TOKEN+":"+ENV.CLIENT_SECRET_TOKEN
        let data = basicToken.data(using: .utf8)
        guard let base64String = data?.base64EncodedString() else {
            print("Failure to get base64")
            completion(false)
            return
        }
        
        request.setValue(
            "Basic \(base64String)",
            forHTTPHeaderField: "Authorization"
        )
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,
                  error == nil else {
                completion(false)
                return
            }
            
            let successRange = 200..<300
            
            guard let httpStatustCode = response as? HTTPURLResponse,
                  successRange.contains(httpStatustCode.statusCode)
            else {
                return
            }
            
            
            do {
                let result = try JSONDecoder().decode(AuthResponse.self, from: data)
                print("Successfully refreshed")
                self?.cacheToken(result: result)
                completion(true)
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
        }
        task.resume()
    }
    
    private func cacheToken(result: AuthResponse) {
        UserDefaults.standard.setValue(
            result.accessToken,
            forKey: "accessToken"
        )
        
        if let refreshToken = result.refreshToken {
            UserDefaults.standard.setValue(
                refreshToken,
                forKey: "refreshToken"
            )
        }
        
        UserDefaults.standard.setValue(
            Date().addingTimeInterval(TimeInterval(result.expiresIn)),
            forKey: "expirationDate"
        )
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
            return "user-read-private playlist-modify-public playlist-read-private playlist-modify-private user-follow-read user-library-modify user-library-read user-read-email"
        case .redirectURI:
            return "https://github.com/devKobe24/Spotify_Clone"
        case .base:
            return "https://accounts.spotify.com/authorize"
        case .signInURL:
            return "\(AuthManagerNameSpace.base.localized)?response_type=code&client_id=\(ENV.CLIENT_ID_TOKEN)&scope=\(AuthManagerNameSpace.scopes.localized)&redirect_uri=\(AuthManagerNameSpace.redirectURI.localized)&show_dialog=TRUE"
        }
    }
}
