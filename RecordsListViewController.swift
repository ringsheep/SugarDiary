//
//  List of diary records, adding and deleting records from diary
//

import UIKit

class RecordsListViewController: UIViewController {
    
    fileprivate let estimatedRowHeight: CGFloat = 100.0
    fileprivate var viewModel = RecordsListViewModel()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = self.estimatedRowHeight
        
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Sugar Diary"
        setupNavbar()
        setupTableView()
        reloadData()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupNavbar() {
        setEditBarButtonItem()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(createRecord))
    }
    
    func reloadData() {
        viewModel.getRecords()
        tableView.reloadData()
    }
    
    func createRecord() {
        endEditing()
        viewModel.createRecord(on: self)
    }
}

extension RecordsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRecords()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            String(describing: RecordTableViewCell.self))
            as? RecordTableViewCell ?? RecordTableViewCell()
        
        cell.set(date: viewModel.recordDateString(at: indexPath.row),
                 sugarLevel: viewModel.recordSugarLevelString(at: indexPath.row),
                 medicationAmount: viewModel.recordMedicationAmountString(at: indexPath.row),
                 breadUnits: viewModel.recordBreadUnitsString(at: indexPath.row),
                 sugarRate: viewModel.recordSugarRate(at: indexPath.row))
        
        return cell
    }
}

extension RecordsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.editRecord(at: indexPath.row, on: self)
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.deleteRecord(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension RecordsListViewController: RecordsListDelegate {
    
}

// MARK: - Editing
extension RecordsListViewController {
    func setEditBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                           target: self,
                                                           action: #selector(beginEditing))
    }
    
    func beginEditing() {
        tableView.setEditing(true, animated: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                           target: self,
                                                           action: #selector(endEditing))
    }
    
    func endEditing() {
        tableView.setEditing(false, animated: true)
        setEditBarButtonItem()
    }
}
