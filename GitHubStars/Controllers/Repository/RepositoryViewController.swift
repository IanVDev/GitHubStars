import UIKit

class RepositoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var repositories = [GitHubModel]()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.getRepositories()
    }
    
    //MARK: - Layout
    
    //MARK: - Actions
    
    //MARK: - Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        
        let repository = self.repositories[indexPath.row]
        
        cell.setupCell(repository: repository)
        
        return cell
    }
    
    //MARK: - API
    func getRepositories() {
        
        GitHubAPI.getRepositories(page: 0) { (gitHubListModel, error) in
            
            guard let gitHubListModel = gitHubListModel else { return }
            guard let repositories = gitHubListModel.items else { return }
            
            self.didFetchRepositories(repositories: repositories)
        }
    }
    
    //MARK: - API Callback
    func didFetchRepositories(repositories: [GitHubModel]) {
        
        self.repositories = repositories
        
        self.tableView.reloadData()
    }
}
