//
//  ResultViewController.swift
//  AccelerationSensor
//
//  Created by 土居将史 on 2018/06/25.
//  Copyright © 2018年 土居将史. All rights reserved.
//

import UIKit
import Charts

class ResultViewController: UIViewController{
    
    var Delegate = UIApplication.shared.delegate as! AppDelegate

    @IBOutlet weak var ChartView: UIScrollView!
    
   
    override func viewDidLoad() {
            super.viewDidLoad()
            setChart()
    }
    
    func setChart() {
        var data:[Double] = []
        for i in (0..<Delegate.resultData.count){
         data.append(Delegate.resultData[i].x)
        }
        let base = AxisBase()
        
        base.labelCount = Int(10)
        
        let rect = CGRect(x:0, y: 10, width: self.ChartView.frame.width - 55, height: self.ChartView.frame.height - 160)
        let chartView = LineChartView(frame: rect)
        
        chartView.animate(xAxisDuration: 3)
        
        var entry = [ChartDataEntry]()
        
        for (i, d) in data.enumerated() {
            entry.append(ChartDataEntry(x: Double(i), y: d ))
        }
    
        let dataSet = LineChartDataSet(values: entry, label: "data")
        
        chartView.data = LineChartData(dataSet: dataSet)
        
        self.ChartView.addSubview(chartView)
        
        Delegate.resultData = []
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
