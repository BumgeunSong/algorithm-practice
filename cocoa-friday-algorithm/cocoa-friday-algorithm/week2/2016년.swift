//
//  2016년.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/12.
//

import Foundation

func whichDayIn2016(_ a:Int, _ b:Int) -> String {
    let calendar = Calendar.current
    var target = DateComponents(calendar: calendar, timeZone: calendar.timeZone ,year: 2016, month: 5, day: 24-1)
    var targetDate = calendar.date(from: target)!
    var weekday = calendar.component(.weekday, from: targetDate)
    return calendar.shortWeekdaySymbols[weekday].uppercased()
}
