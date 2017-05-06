//
//  GraphViewController.swift
//  MyWallet
//
//  Created by 宿志鹏 on 2017/4/29.
//  Copyright © 2017年 Jerry Su. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController, ChartViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var pieChartView: PieChartView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataarr = [
        ["name": "购物",
         "data": 83.46
        ],
        ["name": "饮食",
         "data": 10.11
        ],
        ["name": "交通",
         "data": 6.43
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pieChartView.delegate = self
        
        pieChartView.animate(xAxisDuration: 1.4, easingOption: .easeOutCubic)
        self.setChartData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Chart
    
    func setChartData() {
        var dataEntries = [ChartDataEntry]()
        
        for i in 0..<dataarr.count {
            let dic = dataarr[i]
            let tempEntry = PieChartDataEntry(value: dic["data"] as! Double, label: dic["name"] as! String)
            dataEntries.append(tempEntry)
        }
        
        var chartDataSet = PieChartDataSet(values: dataEntries, label: "")
        
        chartDataSet.drawIconsEnabled = false
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.chartDescription?.text = ""
        
        
        
        chartDataSet.sliceSpace = 2.0
        chartDataSet.iconsOffset = CGPoint(x: 0, y: 40)
        
        chartDataSet.colors = ChartColorTemplates.colorful() + ChartColorTemplates.joyful()
        
        let data = PieChartData(dataSet: chartDataSet)
        
        let nFormatter = NumberFormatter()
        nFormatter.numberStyle = .percent
        nFormatter.maximumFractionDigits = 1
        nFormatter.multiplier = 1.00
        nFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: nFormatter))
        pieChartView.data = data
        pieChartView.highlightValues(nil)
        
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "起始时间"
            cell.detailTextLabel?.text = "2017-3-1"
        case 1:
            cell.textLabel?.text = "终止时间"
            cell.detailTextLabel?.text = "2017-3-31"
        case 2:
            cell.textLabel?.text = "图表类型"
            cell.detailTextLabel?.text = "支出结构饼图"
        default:
            fatalError()
        }
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
