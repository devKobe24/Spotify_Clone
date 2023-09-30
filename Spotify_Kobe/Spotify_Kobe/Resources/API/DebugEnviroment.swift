//
//  DebugEnviroment.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/09/30.
//

final class DebugEnviroment: BaseEnvironment, APIKeyable {
    
    init() {
        super.init(enviromentName: APIEnviroments.debugApiEnviroment.name)
    }
    
    var CLIENT_ID_TOKEN: String {
        guard let clientIdTokenKey = dict.object(forKey: APIKeys.clientIdToken) as? String else {
            return "ERROR"
        }
        return clientIdTokenKey
    }
    
    var CLIENT_SECRET_TOKEN: String {
        guard let clientSecretToken = dict.object(forKey: APIKeys.clientSecretToken) as? String else {
            return "ERROR"
        }
        return clientSecretToken
    }
}
