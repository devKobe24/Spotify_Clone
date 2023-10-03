//
//  BodyParameters.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/10/03.
//

enum BodyParameters {
    case grant_type
    case code
    case redirect_uri
    
    var value: String {
        switch self {
        case .grant_type:
            return "grant_type"
        case .code:
            return "code"
        case .redirect_uri:
            return "redirect_uri"
        }
    }
}
