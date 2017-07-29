//
//  Updates and saves a single dairy record
//

import Foundation

class EditRecordViewModel {
    
    fileprivate var record: DiaryRecord
    fileprivate let service = DiaryRecordsService()
    
    init(record: DiaryRecord = DiaryRecord()) {
        self.record = record
    }
    
    func setDate(date: Date) {
        record.date = date
    }
    
    func setSugarLevel(levelString: String) {
        let levelDouble: Double = Double(levelString) ?? 0.0
        record.sugarLevel = levelDouble
    }
    
    func setMedicationAmount(amountString: String) {
        let amountDouble: Double = Double(amountString) ?? 0.0
        record.medicationAmount = amountDouble
    }
    
    func saveChanges() {
        service.addOrUpdateRecord(record)
    }
    
}
