//
//  CoronaData.swift
//  CoronaGraph
//
//  Created by RJ Pimentel on 3/31/20.
//  Copyright © 2020 RJ Pimentel. All rights reserved.
//

import Foundation
import Charts

class CoronaData {
    var dateToCases = [Date: Int]()
    
    func refresh(completion: @escaping () -> Void) {
        let urlString = "https://corona.lmao.ninja/v2/historical/it"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let coronaData = data else { return }
            let json = try? JSONSerialization.jsonObject(with: coronaData, options: [])
            guard let dictionary = json as? [String: Any] else { return }
            guard let timeline = dictionary["timeline"] as? [String: Any] else { return }
            guard let cases = timeline["cases"] as? [String: Int] else { return }
            
            for (date, count) in cases {
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yy"
                let date = formatter.date(from: date)!
                self.dateToCases[date] = count
            }
            completion()
        }.resume()
    }
    
    func toLineData() -> LineChartData {
        var chartData = [ChartDataEntry]()
        let sortedDates = dateToCases.keys.sorted()
        for i in 0 ..< sortedDates.count {
            chartData.append(ChartDataEntry(x: Double(i), y: Double(dateToCases[sortedDates[i]]!)))
        }
        let set = LineChartDataSet(entries: chartData, label: "Cases")
        
        set.lineWidth = 1.75
        set.circleRadius = 5.0
        set.circleHoleRadius = 2.5
        set.setColor(.black)
        set.setCircleColor(.black)
        set.highlightColor = .black
        set.drawValuesEnabled = false
        
        return LineChartData(dataSet: set)
    }
    
    
}
