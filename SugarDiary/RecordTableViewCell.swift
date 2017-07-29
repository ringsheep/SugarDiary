//
//  Table cell which displays date of sugar mesuring, sugar level and medication amount
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    fileprivate let defaultSpacing: CGFloat = 12.0
    fileprivate let dateLabelWidth: CGFloat = 120.0
    fileprivate let rateLabelWidth: CGFloat = 80.0
    fileprivate let badgeLabelWidth: CGFloat = 60.0
    fileprivate let labelHeight: CGFloat = 24.0
    
    fileprivate var sugarRate: SugarRate = .low {
        didSet {
            setupSugarRateLabel()
        }
    }
    
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
    
    fileprivate lazy var sugarRateBadgeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
        contentView.addSubview(sugarRateBadgeLabel)
        contentView.addSubview(medicationAmountLabel)
        contentView.addSubview(breadUnitsLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        dateLabel.leading(to: contentView.leadingAnchor, constant: defaultSpacing)
        dateLabel.top(to: contentView.topAnchor, constant: defaultSpacing)
        dateLabel.width(to: dateLabelWidth)
        dateLabel.height(to: labelHeight)
        
        sugarLevelLabel.leading(to: dateLabel.trailingAnchor, constant: defaultSpacing * 2)
        sugarLevelLabel.centerY(to: dateLabel.centerYAnchor)
        sugarLevelLabel.width(to: rateLabelWidth)
        sugarLevelLabel.height(to: labelHeight)
        
        sugarRateBadgeLabel.leading(to:  sugarLevelLabel.trailingAnchor, constant: defaultSpacing)
        sugarRateBadgeLabel.centerY(to: sugarLevelLabel.centerYAnchor)
        sugarRateBadgeLabel.height(to: labelHeight)
        sugarRateBadgeLabel.width(to: badgeLabelWidth)
        
        breadUnitsLabel.leading(to: sugarLevelLabel.leadingAnchor)
        breadUnitsLabel.top(to: dateLabel.bottomAnchor, constant: defaultSpacing)
        breadUnitsLabel.width(to: rateLabelWidth)
        breadUnitsLabel.bottom(to: contentView.bottomAnchor, constant: -defaultSpacing)
        breadUnitsLabel.height(to: labelHeight)
        
        medicationAmountLabel.leading(to:  breadUnitsLabel.trailingAnchor, constant: defaultSpacing)
        medicationAmountLabel.centerY(to: breadUnitsLabel.centerYAnchor)
        medicationAmountLabel.width(to: rateLabelWidth)
        medicationAmountLabel.height(to: labelHeight)
    }
    
    func set(date: String,
             sugarLevel: String,
             medicationAmount: String,
             breadUnits: String,
             sugarRate: SugarRate) {
        dateLabel.text = date
        sugarLevelLabel.text = "❤️: \(sugarLevel)"
        medicationAmountLabel.text = "💉: \(medicationAmount)"
        breadUnitsLabel.text = "🍞: \(breadUnits)"
        self.sugarRate = sugarRate
    }
    
    func setupSugarRateLabel() {
        switch sugarRate {
        case .low:
            sugarRateBadgeLabel.text = "Low"
            sugarRateBadgeLabel.backgroundColor = .blue
        case .good:
            sugarRateBadgeLabel.text = "Good"
            sugarRateBadgeLabel.backgroundColor = .darkGreen
        case .high:
            sugarRateBadgeLabel.text = "High"
            sugarRateBadgeLabel.backgroundColor = .orange
        case .enormous:
            sugarRateBadgeLabel.text = "Awful"
            sugarRateBadgeLabel.backgroundColor = .red
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        setupSugarRateLabel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupSugarRateLabel()
    }
}

fileprivate extension UIColor {
    static var darkGreen: UIColor {
        return UIColor(colorLiteralRed: 0.0, green: 0.75, blue: 0.0, alpha: 1.0)
    }
}
