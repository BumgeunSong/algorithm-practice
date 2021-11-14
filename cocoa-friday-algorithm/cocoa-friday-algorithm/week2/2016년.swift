//
//  2016년.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/12.
//

import Foundation

func whichDayIn2016(_ a:Int, _ b:Int) -> String {
    let dateFormatterInput = DateFormatter()
    dateFormatterInput.dateFormat = "yyyy-MM-dd"
    
    let targetDate = dateFormatterInput.date(from: "2016-\(a)-\(b)")
    
    let dateFormatterOutput = DateFormatter()
    dateFormatterOutput.dateFormat = "EE"
    
    let weekday = dateFormatterOutput.string(from: targetDate!).uppercased()
    return weekday
}
