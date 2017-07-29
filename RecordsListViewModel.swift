//
//  Logic for displaying and editing the diary
//

import Foundation
import UIKit

enum SugarRate {
    case low, good, high, enormous
}

class RecordsListViewModel {
    
    fileprivate var records: [DiaryRecord] = []
    fileprivate let service = DiaryRecordsService()
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm"
        return formatter
    }()
    
    func getRecords() {
        records = service.getRecords().sorted(by: { $0.date > $1.date })
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
    
    func recordBreadUnitsString(at index: Int) -> String {
        return "\(record(at: index).breadUnits)"
    }
    
    func recordSugarRate(at index: Int) -> SugarRate {
        switch record(at: index).sugarLevel {
        case 0..<5:
            return .low
        case 5..<7.5:
            return .good
        case 7.5..<10:
            return .high
        default:
            return .enormous
        }
    }
    
    fileprivate func record(at index: Int) -> DiaryRecord {
        guard index < records.count else {
            return DiaryRecord()
        }
        return records[index]
    }
    
    // MARK: - Actions
    
    func deleteRecord(at index: Int) {
        service.removeRecord(record(at: index))
        getRecords()
    }
    
    func editRecord(at index: Int, on viewController: RecordsListViewController) {
        openRecord(with: record(at: index), on: viewController)
    }
    
    func createRecord(on viewController: RecordsListViewController) {
        openRecord(with: DiaryRecord(), on: viewController)
    }
    
    func openRecord(with record: DiaryRecord,
                    on viewController: RecordsListViewController) {
        let editRecordViewModel = EditRecordViewModel(record: record)
        editRecordViewModel.delegate = viewController
        let editRecordViewController = EditRecordViewController(editRecordViewModel)
        let recordNavigationController = UINavigationController(rootViewController: editRecordViewController)
        viewController.navigationController?.present(recordNavigationController,
                                                     animated: true,
                                                     completion: nil)
    }
    
}
