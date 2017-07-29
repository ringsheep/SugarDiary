//
//  Converts dairy record to/from dictionary for saving to user defaults
//

import Foundation

class DiaryRecordTranslator {
    
    fileprivate let dateKey = "date"
    fileprivate let sugarLevelKey = "sugarLevel"
    fileprivate let medicationAmountKey = "medicationAmount"
    
    func translate(from dictionary: [String: Any]) -> DiaryRecord {
        let date: Date = dictionary[dateKey] as? Date ?? Date()
        let sugarLevel: Double = dictionary[sugarLevelKey] as? Double ?? 0.0
        let medicationAmount: Double = dictionary[medicationAmountKey] as? Double ?? 0.0
        
        return DiaryRecord(date: date, sugarLevel: sugarLevel, medicationAmount: medicationAmount)
    }
    
    func convert(from record: DiaryRecord) -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        dictionary[dateKey] = record.date
        dictionary[sugarLevelKey] = record.sugarLevel
        dictionary[medicationAmountKey] = record.medicationAmount
        
        return dictionary
    }
}
