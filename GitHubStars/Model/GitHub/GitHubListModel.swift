
import UIKit

public struct GitHubListModel: Codable {
    
    public var items: [GitHubModel]?
    
    public init(items: [GitHubModel]?=nil) {
        
        self.items = items
    }
}
