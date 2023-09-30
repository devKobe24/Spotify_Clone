//
//  BaseEnvironment.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/09/30.
//

import Foundation

class BaseEnvironment {
    var dict: NSDictionary = NSDictionary()
    let enviromentName: String
    
    init(enviromentName: String) {
        self.enviromentName = enviromentName
        self.fetchPlist()
    }
}

extension BaseEnvironment {
    private func fetchPlist() {
        guard let filePath = Bundle.main.path(forResource: enviromentName, ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath) else {
            return
        }
        self.dict = plist
    }
}
