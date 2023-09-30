//
//  Bundle+.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/09/30.
//

import Foundation
import OSLog

extension Bundle {
    var clientIdTokenForProdInfoVer: String? {
        guard let file = self.path(forResource: APIEnviroments.infoPropertyListEnviroment.name, ofType: "plist"),
              let resource = NSDictionary(contentsOfFile: file),
              let key = resource[APIKeys.clientIdToken.name] as? String else {
            Logger().log("⛔️ \(APIEnviroments.infoPropertyListEnviroment.name).plist 를 찾을 수 없습니다.")
            Logger().log("⛔️ \(APIKeys.clientIdToken.name) key 를 찾을 수 없습니다.")
            return nil
        }
        return key
    }
}
