//
//  ViewController.swift
//  CoronaGraph
//
//  Created by RJ Pimentel on 3/31/20.
//  Copyright © 2020 RJ Pimentel. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var chart: LineChartView!
    var coronaData = CoronaData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coronaData.refresh() {
            DispatchQueue.main.async {
                self.setupChart()
            }
        }
    }
    
    func setupChart() {
            let data = coronaData.toLineData()
            chart.data = data
            
            chart.chartDescription?.enabled = false
            
            chart.dragEnabled = false
            chart.setScaleEnabled(false)
            chart.pinchZoomEnabled = false
            
            
            chart.legend.enabled = false
            
            chart.leftAxis.enabled = true
            chart.leftAxis.drawAxisLineEnabled = false
            chart.leftAxis.spaceTop = 0.4
            chart.leftAxis.spaceBottom = 0.4
            chart.leftAxis.axisMinimum = 0
            
            chart.rightAxis.enabled = false
            

            
            chart.xAxis.labelPosition = XAxis.LabelPosition.bottom
            chart.xAxis.drawGridLinesEnabled = false
            
            chart.animate(xAxisDuration: 2.5)
    }


}
