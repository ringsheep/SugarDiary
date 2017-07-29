//
//  Charts of sugar level
//

import UIKit
import Charts

class RecordsChartsViewController: UIViewController {
    
    fileprivate let outerMargin: CGFloat = 12.0
    
    fileprivate lazy var pieChartView: PieChartView = {
        let chartView = PieChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.usePercentValuesEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.4
        chartView.transparentCircleRadiusPercent = 0.61
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 5.0, top: 10.0, right: 5.0, bottom: 5.0)
        chartView.drawCenterTextEnabled = true
        chartView.centerText = "Sugar levels\nby 30 days"
        chartView.drawHoleEnabled = true
        chartView.rotationAngle = 0.0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = true
        
        chartView.legend.horizontalAlignment = .right
        chartView.legend.verticalAlignment = .top
        chartView.legend.orientation = .vertical
        chartView.legend.drawInside = false
        chartView.legend.xEntrySpace = 7.0
        chartView.legend.yEntrySpace = 0.0
        chartView.legend.yOffset = 0.0
        return chartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pieChartView)
        
        setupConstraints()
        updateChartData()
    }
    
    func setupConstraints() {
        pieChartView.leading(to: view.leadingAnchor)
        pieChartView.top(to: topLayoutGuide.bottomAnchor)
        pieChartView.trailing(to: view.trailingAnchor)
        pieChartView.bottom(to: bottomLayoutGuide.topAnchor)
    }
    
    func updateChartData() {
        var entries: [PieChartDataEntry] = []
        
        for i in 0..<100 {
            entries.append(PieChartDataEntry(value: (Double(arc4random_uniform(UInt32(3)))),
                                             label: nil))
        }
        
        let dataSet = PieChartDataSet(values: entries, label: "Election Results")
        dataSet.sliceSpace = 2.0
        
        dataSet.colors = [.red, .green, .blue, .orange]
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.4
        
        dataSet.yValuePosition = .outsideSlice
        let data = PieChartData(dataSet: dataSet)
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1.0
        pFormatter.percentSymbol = ""
        
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        data.setValueFont(UIFont.systemFont(ofSize: 11.0))
        data.setValueTextColor(.black)
        pieChartView.data = data
        pieChartView.highlightValues(nil)
    }
    
}
