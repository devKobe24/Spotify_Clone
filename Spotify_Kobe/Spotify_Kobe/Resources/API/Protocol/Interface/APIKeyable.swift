//
//  APIKeyable.swift
//  Spotify_Kobe
//
//  Created by Minseong Kang on 2023/09/30.
//

protocol APIKeyable {
    var CLIENT_ID_TOKEN: String { get }
    var CLIENT_SECRET_TOKEN: String { get }
}
