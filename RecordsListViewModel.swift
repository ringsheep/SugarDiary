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
    
}
