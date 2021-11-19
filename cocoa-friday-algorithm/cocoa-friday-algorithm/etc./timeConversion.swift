//
//  timeConversion.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//

import Foundation

func timeConversion(s: String) -> String {
    var str = s
    
    let ampmRange = str.index(str.endIndex, offsetBy: -2)..<str.endIndex
    let ampm = str[ampmRange]
    str.removeSubrange(ampmRange)
    
    var split = str.split(separator: ":").map{ String($0) }
    
    // 1. PM이면 12시간을 더해주고, 12:00PM일 때만 그냥 둔다.
    if ampm == "PM" && split[0] != "12" {
        split[0] = String(Int(split[0])! + 12)
    }
    // 2. AM이면 그대로 두고, 12:00AM일 때만 00:00으로 바꿔준다.
    else if ampm == "AM" && split[0] == "12" {
        split[0] = "00"
    }
    
    str = split.joined(separator: ":")
    
    return str
}
