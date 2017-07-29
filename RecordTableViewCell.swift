//
//  Table cell which displays date of sugar mesuring, sugar level and medication amount
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    fileprivate let defaultSpacing: CGFloat = 12.0
    fileprivate let dateLabelWidth: CGFloat = 100.0
    fileprivate let rateLabelWidth: CGFloat = 80.0
    
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
        setupConstraints()
    }
    
    func setupConstraints() {
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                           constant: defaultSpacing).isActive = true
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                       constant: defaultSpacing).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                          constant: -defaultSpacing).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: dateLabelWidth).isActive = true
        
        sugarLevelLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor,
                                                 constant: defaultSpacing*2).isActive = true
        sugarLevelLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor).isActive = true
        sugarLevelLabel.widthAnchor.constraint(equalToConstant: rateLabelWidth).isActive = true

        
        medicationAmountLabel.leadingAnchor.constraint(equalTo: sugarLevelLabel.trailingAnchor,
                                                       constant: defaultSpacing).isActive = true
        medicationAmountLabel.centerYAnchor.constraint(equalTo: sugarLevelLabel.centerYAnchor).isActive = true
        medicationAmountLabel.widthAnchor.constraint(equalToConstant: rateLabelWidth).isActive = true
    }
    
    func set(date: String, sugarLevel: String, medicationAmount: String) {
        dateLabel.text = date
        sugarLevelLabel.text = "❤️: \(sugarLevel)"
        medicationAmountLabel.text = "💉: \(medicationAmount)"
    }
}
