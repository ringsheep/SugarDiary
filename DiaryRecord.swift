//
//  A single slice of sugar data - dto with date, sugar level and medication amount
//

import Foundation

struct DiaryRecord {
    var date: Date
    var sugarLevel: Double
    var medicationAmount: Double
    var breadUnits: Double
    
    init(date: Date = Date(),
         sugarLevel: Double = 0.0,
         medicationAmount: Double = 0.0,
         breadUnits: Double = 0.0) {
        self.date = date
        self.sugarLevel = sugarLevel
        self.medicationAmount = medicationAmount
        self.breadUnits = breadUnits
    }
}

extension DiaryRecord: Equatable {
    public static func ==(lhs: DiaryRecord, rhs: DiaryRecord) -> Bool {
        return lhs.date == rhs.date
    }
}
