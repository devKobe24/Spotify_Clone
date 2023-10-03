//
//  Urls.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/10/01.
//

enum Urls {
    case tokenAPI
    
    var value: String {
        switch self {
        case .tokenAPI:
            "https://accounts.spotify.com/api/token"
        }
    }
}
