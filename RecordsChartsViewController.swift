//
//  Charts of sugar level
//

import UIKit
import Charts

class RecordsChartsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setupPieChartView(_ chartView: PieChartView) {
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.58
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5.0, top: 10.0, right: 5.0, bottom: 5.0)
        chartView.drawCenterTextEnabled = true
        
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle.default as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        
        let centerText = NSMutableAttributedString(string: "Charts\nby Daniel Cohen Gindi")
        
        centerText.setAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 13.0),
                                  NSParagraphStyleAttributeName: paragraphStyle],
                                 range: NSRange(location: 0,
                                                length: centerText.length))
        
        centerText.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 11.0),
                                  NSForegroundColorAttributeName: UIColor.gray],
                                 range: NSRange(location: 10,
                                                length: centerText.length - 10))
        
        centerText.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 11.0),
                                  NSForegroundColorAttributeName: UIColor(red: 51 / 255.0,
                                                                          green: 181 / 255.0,
                                                                          blue: 229 / 255.0,
                                                                          alpha: 1.0)],
                                 range: NSRange(location: centerText.length - 19,
                                                length: 19))
        
        chartView.centerAttributedText = centerText
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0.0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        
        let legend: Legend? = chartView.legend
        legend?.horizontalAlignment = .right
        legend?.verticalAlignment = .top
        legend?.orientation = .vertical
        legend?.drawInside = false
        legend?.xEntrySpace = 7.0
        legend?.yEntrySpace = 0.0
        legend?.yOffset = 0.0
    }
    
}
