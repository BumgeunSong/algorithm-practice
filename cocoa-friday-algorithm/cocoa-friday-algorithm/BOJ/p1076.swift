//
//  p1076.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/05.
//

import Foundation

func p1076() {
    let color1 = readLine()!
    let color2 = readLine()!
    let color3 = readLine()!
    
    func getOhmValue(color: String) -> Int? {
        switch color {
        case "black": return 0
        case "brown": return 1
        case "red": return 2
        case "orange": return 3
        case "yellow": return 4
        case "green": return 5
        case "blue": return 6
        case "violet": return 7
        case "grey": return 8
        case "white": return 9
        default: return nil
        }
    }
    
    if let value1 = getOhmValue(color: color1), let value2 = getOhmValue(color: color2), let value3 = getOhmValue(color: color3) {
        let result = String(value1) + String(value2) + String(repeating: "0", count: value3)
        print(Int(result)!)
    }
}
