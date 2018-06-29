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
        
        let combinedData = CombinedChartData()
        
        //グラフに表示するための参考する値を格納する配列
        var dataX:[Double] = []
        var dataY:[Double] = []
        var dataZ:[Double] = []
        
        let chartbase = AxisBase()
        chartbase.labelCount = Int(Delegate.resultData.count)
        
        //配列に代入
        for i in (0..<Delegate.resultData.count){
            dataX.append(Delegate.resultData[i].x)
            dataY.append(Delegate.resultData[i].y)
            dataZ.append(Delegate.resultData[i].z)
        }
        
        //グラフの全体図の設定
        let rect = CGRect(x:0, y: 10, width: self.ChartView.frame.width - 5, height: self.ChartView.frame.height - 100)
        let chartView = CombinedChartView(frame: rect) //折れ線グラフに設定
        
        //chartView.animate(xAxisDuration: 3)//グラフ表示のアニメーション設定
        
        var entry_x = [ChartDataEntry]()
        var entry_y = [ChartDataEntry]()
        var entry_z = [ChartDataEntry]()
        
        //グラフ用の配列に代入
        for (i, d) in dataX.enumerated() {
            entry_x.append(ChartDataEntry(x: Double(i) * 0.1, y: d ))
        }
        for (i, d) in dataY.enumerated() {
            entry_y.append(ChartDataEntry(x: Double(i) * 0.1, y: d ))
        }
        for (i, d) in dataZ.enumerated() {
            entry_z.append(ChartDataEntry(x: Double(i) * 0.1, y: d ))
        }
    
        var linedata = [LineChartDataSet]()
        
        //それぞれのデータをグラフ用にセット
        let lineDataSet = LineChartDataSet(values: entry_x, label: "x data")
        lineDataSet.drawCirclesEnabled = false
        lineDataSet.drawIconsEnabled = false
        lineDataSet.colors = [NSUIColor.red]
        lineDataSet.circleColors = [NSUIColor.red]
        linedata.append(lineDataSet)
        
        let lineDataSet2 = LineChartDataSet(values: entry_y, label: "y data")
        lineDataSet2.drawIconsEnabled = false
        lineDataSet2.drawCirclesEnabled = false
        lineDataSet2.colors = [NSUIColor.blue]
        lineDataSet2.circleColors = [NSUIColor.blue]
        linedata.append(lineDataSet2)
        
        
        let lineDataSet3 = LineChartDataSet(values: entry_z, label: "z data")
        lineDataSet3.drawIconsEnabled = false
        lineDataSet3.drawCirclesEnabled = false
        lineDataSet3.colors = [NSUIColor.green]
        lineDataSet3.circleColors = [NSUIColor.green]
        linedata.append(lineDataSet3)
        
        combinedData.lineData = LineChartData(dataSets: linedata)
        
        chartView.data = combinedData
        
        self.ChartView.addSubview(chartView)
        
        Delegate.resultData = []
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
