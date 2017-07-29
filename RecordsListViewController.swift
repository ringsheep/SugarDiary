//
//  List of diary records, adding and deleting records from diary
//

import UIKit

class RecordsListViewController: UIViewController {
    
    fileprivate var viewModel = RecordsListViewModel()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(createRecord))
    }
    
    func reloadData() {
        viewModel.getRecords()
        tableView.reloadData()
    }
    
    func createRecord() {
        viewModel.createRecord(on: self, with: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.reloadData()
        })
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
                 medicationAmount: viewModel.recordMedicationAmountString(at: indexPath.row))
        
        return cell
    }
}

extension RecordsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        viewModel.editRecord(at: indexPath.row, on: self, with: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.reloadData()
        })
    }
}
