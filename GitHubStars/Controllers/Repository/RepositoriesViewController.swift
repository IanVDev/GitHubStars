import UIKit

class RepositoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    //MARK: - Layout
    
    //MARK: - Actions
    
    //MARK: - Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return 1
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        return UITableViewCell()
     }
}
