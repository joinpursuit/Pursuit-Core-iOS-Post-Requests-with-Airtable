import UIKit

class ProjectsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var projectsTableView: UITableView!
    
    // MARK: - Private Properties
    
    private var projects = [Project]() {
        didSet {
            projectsTableView.reloadData()
        }
    }
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        loadData()
    }
    
    // MARK: - Private Methods
    
    private func configureTableView() {
        projectsTableView.delegate = self
        projectsTableView.dataSource = self
    }
    
    private func loadData() {}
}

extension ProjectsViewController: UITableViewDelegate {}

extension ProjectsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let project = projects[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
        cell.textLabel?.text = project.name
        cell.detailTextLabel?.text = project.dueDate
        return cell
    }
}
