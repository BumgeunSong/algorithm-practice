//
//  todayHouse.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/09.
//

import Foundation
//
//func solution(_ path: String) -> [String] {
//    let path = Array(path)
//    
//    //
//    var turningPoint: [Int] = []
//    var directions: [String] = []
//    
//    for i in 1..<path.count {
//        if path[i] != path[i-1] {
//            turningPoint.append(i)
//            directions.append(getDirection(path[i], path[i-1]))
//        }
//    }
//    
//    var messageIndex: [Int] = []
//    var distanceLeft: [Int] = []
//    var next = 0
//    var time = 0
//    
//    while time < path.count, next < turningPoint.count {
//        if turningPoint[next] - time <= 5 {
//            messageIndex.append(time)
//            distanceLeft.append(turningPoint[next] - time)
//            time = next
//            next += 1
//        } else {
//            time += 1
//        }
//    }
//    
//    
//    
//}
//
//func getDirection(_ char1: Character, _ char2: Character) -> String {
//    switch (char1, char2) {
//    case ("E", "S"): return "right"
//    case ("S", "W"): return "right"
//    case ("W", "N"): return "right"
//    case ("N", "E"): return "right"
//    case ("E", "N"): return "left"
//    case ("S", "E"): return "right"
//    case ("W", "S"): return "right"
//    case ("N", "W"): return "right"
//    default: return "error"
//    }
//    
//
//}
