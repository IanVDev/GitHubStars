//
//  GitHubListModel.swift
//  GitHubStars
//
//  Created by Ana Finotti on 19/08/20.
//  Copyright © 2020 ian. All rights reserved.
//

import UIKit

public struct GitHubListModel: Codable {
    
    public var items: [GitHubModel]?
    
    public init(items: [GitHubModel]?=nil) {
        
        self.items = items
    }
}
