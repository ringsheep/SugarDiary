//
//  Updates and saves a single dairy record
//

import Foundation

protocol RecordsListDelegate: class {
    func reloadData()
}

class EditRecordViewModel {
    
    fileprivate var record: DiaryRecord
    fileprivate let service = DiaryRecordsService()
    weak var delegate: RecordsListDelegate?
    
    init(record: DiaryRecord = DiaryRecord()) {
        self.record = record
    }
    
    func recordDate() -> Date {
        return record.date
    }
    
    func recordSugarLevelString() -> String? {
        if record.sugarLevel == 0.0 {
            return nil
        } else {
            return "\(record.sugarLevel)"
        }
    }
    
    func recordMedicationAmountString() -> String? {
        if record.medicationAmount == 0.0 {
            return nil
        } else {
            return "\(record.medicationAmount)"
        }
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
    
    func setBreadUnits(unitsString: String) {
        let unitsDouble: Double = Double(unitsString) ?? 0.0
        record.breadUnits = unitsDouble
    }
    
    func validateForm() -> (Bool, String) {
        let isValid = record.sugarLevel > 0.0
        let errorText = isValid ? "" : "Sugar level cannot be zero"
        return (isValid, errorText)
    }
    
    func saveChanges() {
        service.addOrUpdateRecord(record)
    }
    
    func updateList() {
        delegate?.reloadData()
    }
    
}
