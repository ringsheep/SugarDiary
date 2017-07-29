//
//  A guy that saves and fetches records from user defaults
//

import Foundation

class DiaryRecordsService {
    
    fileprivate let dataKey = "SugarDiaryRecordsArray"
    fileprivate let translator = DiaryRecordTranslator()
    
    func addOrUpdateRecord(_ record: DiaryRecord) {
        var records = getRecords()
        if let index = records.index(of: record) {
            records[index] = record
        } else {
            records.append(record)
        }
        saveRecords(records)
    }
    
    func removeRecord(_ record: DiaryRecord) {
        var records = getRecords()
        guard let index = records.index(of: record) else {
            return
        }
        records.remove(at: index)
        saveRecords(records)
    }
    
    func getRecords() -> [DiaryRecord] {
        let dictionaryArray = UserDefaults.standard.array(forKey: dataKey) ?? []
        var recordsArray: [DiaryRecord] = []
        
        for element in dictionaryArray {
            let dictionary = element as? [String: Any] ?? [:]
            let record: DiaryRecord = translator.translate(from: dictionary)
            recordsArray.append(record)
        }
        
        return recordsArray
    }
    
    func saveRecords(_ records: [DiaryRecord]) {
        let arrayForDefaults = NSMutableArray()
        
        for record in records {
            let dictionary = translator.convert(from: record)
            arrayForDefaults.add(dictionary)
        }
        
        UserDefaults.standard.set(arrayForDefaults, forKey: dataKey)
    }
    
}
