//
//  Resources.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/09/30.
//

enum APIEnviroments {
    case produceApiEnvironment
    case debugApiEnviroment
    case infoPropertyListEnviroment
    
    var name: String {
        switch self {
        case .produceApiEnvironment:
            return "PROD-API-TOKEN"
        case .debugApiEnviroment:
            return "DEBUG-API-TOKEN"
        case .infoPropertyListEnviroment:
            return "Info"
        }
    }
}
