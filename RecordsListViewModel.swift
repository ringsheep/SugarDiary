//
//  Logic for displaying and editing the diary
//

import Foundation
import UIKit

class RecordsListViewModel {
    
    fileprivate var records: [DiaryRecord] = []
    fileprivate let service = DiaryRecordsService()
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd/MM HH:mm"
        
        return formatter
    }()
    
    func getRecords() {
        records = service.getRecords()
    }
    
    func numberOfRecords() -> Int {
        return records.count
    }
    
    func recordDateString(at index: Int) -> String {
        return dateFormatter.string(from: record(at: index).date)
    }
    
    func recordSugarLevelString(at index: Int) -> String {
        return "\(record(at: index).sugarLevel)"
    }
    
    func recordMedicationAmountString(at index: Int) -> String {
        return "\(record(at: index).medicationAmount)"
    }
    
    fileprivate func record(at index: Int) -> DiaryRecord {
        guard index < records.count else {
            return DiaryRecord()
        }
        return records[index]
    }
    
    // MARK: - Routing
    
    func editRecord(at index: Int, on viewController: UIViewController, with completion: (() -> Void)?) {
        openRecord(with: record(at: index), on: viewController, with: completion)
    }
    
    func createRecord(on viewController: UIViewController,
                      with completion: (() -> Void)?) {
        openRecord(with: DiaryRecord(), on: viewController, with: completion)
    }
    
    func openRecord(with record: DiaryRecord,
                    on viewController: UIViewController,
                    with completion: (() -> Void)?) {
        let editRecordViewModel = EditRecordViewModel(record: record)
        let editRecordViewController = EditRecordViewController(editRecordViewModel)
        let recordNavigationController = UINavigationController(rootViewController: editRecordViewController)
        viewController.navigationController?.present(recordNavigationController,
                                                     animated: true,
                                                     completion: completion)
    }
    
}
