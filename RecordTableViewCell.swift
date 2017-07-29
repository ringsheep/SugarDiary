//
//  Table cell which displays date of sugar mesuring, sugar level and medication amount
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    fileprivate let defaultSpacing: CGFloat = 12.0
    fileprivate let dateLabelWidth: CGFloat = 120.0
    fileprivate let rateLabelWidth: CGFloat = 80.0
    fileprivate let labelHeight: CGFloat = 24.0
    
    fileprivate lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var sugarLevelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var medicationAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var breadUnitsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(sugarLevelLabel)
        contentView.addSubview(medicationAmountLabel)
        contentView.addSubview(breadUnitsLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                           constant: defaultSpacing).isActive = true
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                       constant: defaultSpacing).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: dateLabelWidth).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        sugarLevelLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor,
                                                 constant: defaultSpacing*2).isActive = true
        sugarLevelLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor).isActive = true
        sugarLevelLabel.widthAnchor.constraint(equalToConstant: rateLabelWidth).isActive = true
        sugarLevelLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        breadUnitsLabel.leadingAnchor.constraint(equalTo: sugarLevelLabel.leadingAnchor).isActive = true
        breadUnitsLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor,
                                                   constant: defaultSpacing).isActive = true
        breadUnitsLabel.widthAnchor.constraint(equalToConstant: rateLabelWidth).isActive = true
        breadUnitsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                          constant: -defaultSpacing).isActive = true
        breadUnitsLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        medicationAmountLabel.leadingAnchor.constraint(equalTo: breadUnitsLabel.trailingAnchor,
                                                 constant: defaultSpacing).isActive = true
        medicationAmountLabel.centerYAnchor.constraint(equalTo: breadUnitsLabel.centerYAnchor).isActive = true
        medicationAmountLabel.widthAnchor.constraint(equalToConstant: rateLabelWidth).isActive = true
        medicationAmountLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
    }
    
    func set(date: String, sugarLevel: String, medicationAmount: String, breadUnits: String) {
        dateLabel.text = date
        sugarLevelLabel.text = "❤️: \(sugarLevel)"
        medicationAmountLabel.text = "💉: \(medicationAmount)"
        breadUnitsLabel.text = "🍞: \(breadUnits)"
    }
}
