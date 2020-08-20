
import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imageViewAvatar: UIImageView!
    @IBOutlet weak var labelRepositoryName: UILabel!
    @IBOutlet weak var labelOwnerName: UILabel!
    @IBOutlet weak var labelStarsCount: UILabel!
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }

    //MARK: - Layout
    func setupCell(repository: GitHubModel) {

        if let name = repository.name {
            
            self.labelRepositoryName.text = name
        }
        
        if let stars = repository.stargazersCount {

            self.labelStarsCount.text = String(format: "%@ %.0f", "Stars:", stars)
        }
        
        if let owner = repository.owner {
            
            if let ownerName = owner.login {
                
                self.labelOwnerName.text = ownerName
            }
            
            if let avatarUrl = owner.avatarUrl {
                
                let url = URL(string: avatarUrl)
                self.imageViewAvatar.kf.setImage(with: url)
            }
        }
    }
    
    //MARK: - Actions
    
    //MARK: - Delegates
}
