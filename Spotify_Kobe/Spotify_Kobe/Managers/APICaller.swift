//
//  APICaller.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/07/09.
//

import Foundation

final class APICaller {
    static let shaerd = APICaller()
    
    private init() {}
    
    public func getCurrentUserProfileProfile(completion: @escaping (Result<UserProfile, Error>) -> Void) {
        
    }
}
