//
//  Converts dairy record to/from dictionary for saving to user defaults
//

import Foundation

class DiaryRecordTranslator {
    
    fileprivate let dateKey = "date"
    fileprivate let sugarLevelKey = "sugarLevel"
    fileprivate let medicationAmountKey = "medicationAmount"
    fileprivate let breadUnitsKey = "breadUnits"
    
    func translate(from dictionary: [String: Any]) -> DiaryRecord {
        let date: Date = dictionary[dateKey] as? Date ?? Date()
        let sugarLevel: Double = dictionary[sugarLevelKey] as? Double ?? 0.0
        let medicationAmount: Double = dictionary[medicationAmountKey] as? Double ?? 0.0
        let breadUnits: Double = dictionary[breadUnitsKey] as? Double ?? 0.0
        
        return DiaryRecord(date: date,
                           sugarLevel: sugarLevel,
                           medicationAmount: medicationAmount,
                           breadUnits: breadUnits)
    }
    
    func convert(from record: DiaryRecord) -> [String: Any] {
        var dictionary: [String: Any] = [:]
        
        dictionary[dateKey] = record.date
        dictionary[sugarLevelKey] = record.sugarLevel
        dictionary[medicationAmountKey] = record.medicationAmount
        dictionary[breadUnitsKey] = record.breadUnits
        
        return dictionary
    }
}
