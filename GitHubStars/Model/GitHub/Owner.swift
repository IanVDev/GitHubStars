//
//  Owner.swift
//  GitHubStars
//
//  Created by Ana Finotti on 19/08/20.
//  Copyright © 2020 ian. All rights reserved.
//

import Foundation

public struct Owner: Codable {
    
    public var login: String?
    public var avatarUrl: String?
    
    public init(login: String?=nil, avatarUrl: String?=nil) {
        
        self.login = login
        self.avatarUrl = avatarUrl
    }
    
    public enum CodingKeys: String, CodingKey {
        
        case login = "login"
        case avatarUrl = "avatar_url"
    }
}
