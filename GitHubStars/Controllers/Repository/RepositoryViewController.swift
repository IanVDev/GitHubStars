import UIKit

class RepositoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var repositories = [GitHubModel]()
    
    var currentPage = 1
    
    lazy var refreshControl: UIRefreshControl = {
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh),
                                 for: .valueChanged)
        return refreshControl
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setupView()
        self.getRepositories(page: self.currentPage)
    }
    
    //MARK: - Layout
    func setupView() {
        
        self.tableView.addSubview(self.refreshControl)
    }
    
    @objc func handleRefresh() {
        
        self.currentPage = 1
        
        self.repositories = [GitHubModel]()
        
        self.getRepositories(page: self.currentPage)
    }
    
    func bottomLoader() {
        
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
        
        self.tableView.tableFooterView = spinner
        self.tableView.tableFooterView?.isHidden = false
    }
    
    //MARK: - Actions
    
    //MARK: - Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        
        if indexPath.row <= self.repositories.count {
            
            let repository = self.repositories[indexPath.row]
        
            cell.setupCell(repository: repository)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == self.repositories.count - 1 {
            
            self.currentPage += 1
            
            self.bottomLoader()
            self.getRepositories(page: self.currentPage)
        }
    }
    
    //MARK: - API
    func getRepositories(page: Int) {
        
        GitHubAPI.getRepositories(page: page) { (gitHubListModel, error) in
            
            guard let gitHubListModel = gitHubListModel else { return }
            guard let repositories = gitHubListModel.items else { return }
            
            self.didFetchRepositories(repositories: repositories)
        }
    }
    
    //MARK: - API Callback
    func didFetchRepositories(repositories: [GitHubModel]) {
        
        self.refreshControl.endRefreshing()
        self.tableView.tableFooterView = nil

        self.repositories.append(contentsOf: repositories)
        
        self.tableView.reloadData()
    }
}
