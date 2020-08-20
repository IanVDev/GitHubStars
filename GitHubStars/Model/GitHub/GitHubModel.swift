//
//  GitHubModel.swift
//  GitHubStars
//
//  Created by Ana Finotti on 19/08/20.
//  Copyright © 2020 ian. All rights reserved.
//

import Foundation

public struct GitHubModel: Codable {

    public var name: String?
    public var owner: Owner?
    public var stargazersCount: Double?

    public init(name: String?=nil, owner: Owner?=nil, stargazersCount: Double?=nil) {
        
        self.name = name
        self.owner = owner
        self.stargazersCount = stargazersCount
    }
    
    public enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case owner = "owner"
        case stargazersCount = "stargazers_count"
    }
}

