//
//  ProduceEnviroment.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/09/30.
//

import Foundation

final class ProduceEnviroment: BaseEnvironment, APIKeyable {
    
    init() {
        super.init(enviromentName: APIEnviroments.produceApiEnvironment.name)
    }
    
    var CLIENT_ID_TOKEN: String {
        guard let clientIdTokenKey = dict.object(forKey: APIKeys.clientIdToken.name) as? String else {
            return "ERROR"
        }
        return clientIdTokenKey
    }
    
    var CLIENT_SECRET_TOKEN: String {
        guard let clientSecretToken = dict.object(forKey: APIKeys.clientSecretToken.name) as? String else {
            return "ERROR"
        }
        return clientSecretToken
    }
}
