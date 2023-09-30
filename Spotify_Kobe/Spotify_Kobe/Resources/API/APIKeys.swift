//
//  ProduceAPI.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/09/30.
//

import Foundation

enum APIKeys {
    case clientIdToken
    case clientSecretToken
    
    var name: String {
        switch self {
        case .clientIdToken:
            return "ClientIdToken"
        case .clientSecretToken:
            return "ClientSecretToken"
        }
    }
}
