//
//  GitHubAPI.swift
//  GitHubStars
//
//  Created by Ana Finotti on 19/08/20.
//  Copyright © 2020 ian. All rights reserved.
//

import UIKit
import Alamofire


class GitHubAPI: NSObject {
    
    private static var sharedInstance = GitHubAPI()

    private var gitHubUrl = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
    
    static func getRepositories(page: Int, completion: @escaping ((_ data: GitHubListModel?,_ error: Error?) -> Void)) {
        
        let parameters = ["page": page,
                          "per_page": 10]
        
        AF.request(self.sharedInstance.gitHubUrl, method: .get, parameters: parameters).response { response in
            
            switch response.result {
                
            case .success(let data):
                
                guard let data = data else { return }
                
                guard let gitHubList = try? JSONDecoder().decode(GitHubListModel.self, from: data) else {
                    return
                }
                
                completion(gitHubList, nil)
                
            case .failure(let error):
                
                print("Request failed with error: \(error)")
                completion(nil, error)
            }
        }
    }
}
