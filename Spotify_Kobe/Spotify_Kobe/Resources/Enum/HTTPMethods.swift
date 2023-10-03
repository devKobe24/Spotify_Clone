//
//  HTTPMethods.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/10/03.
//

enum HTTPMethods {
    case GET
    case POST
    case DELETE
    
    var value: String {
        switch self {
        case .GET:
            return "GET"
        case .POST:
            return "POST"
        case .DELETE:
            return "DELETE"
        }
    }
}
