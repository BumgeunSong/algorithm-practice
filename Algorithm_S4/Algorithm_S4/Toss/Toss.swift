//
//  Toss.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/06.
//

import Foundation


func solution1(_ messages:[[String]]) -> [String] {
    
    let messages = messages.map { parseMessage($0) }
    
    var prevMin = "0"
    var prevHour = "0"
    var prevDay = "0"
    var prevAuthor = ""
    
    var result = [String]()
    for message in messages {
        // 앞메시지가 없을 때
        // 분이 다르면 일단 시간 추가
        // 날짜도 다르면 날짜도 추가
        // 안 다르면 안 추가
        
        // 같은 사람이면 내용만 추가
        // 같은 사람인데 분이 다르면, 이름, 내용 추가.
        // 다른 사람이면 무조건 이름, 내용 추가
        
        if !result.isEmpty {
            if prevMin != message.min || prevAuthor != message.author {
                result.append("(\(prevHour):\(prevMin))")
            }
            
            if prevDay != message.day {
                result.append("-- \(message.dateString) --")
            }
        }
        
        if prevAuthor == message.author {
            if prevMin != message.min { result.append(message.author) }
            result.append(message.contents)
        } else {
            result.append(message.author)
            result.append(message.contents)
        }
        
        prevMin = message.min
        prevHour = message.hour
        prevDay = message.day
        prevAuthor = message.author
    }
    
    // 마지막 시간
    result.append("(\(prevHour):\(prevMin))")
    
    return result
}


struct Message {
    let date: Date
    let dateString: String
    let day: String
    let hour: String
    let min: String
    let author: String
    let contents: String
}

func parseMessage(_ message: [String]) -> Message {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    let date = dateFormatter.date(from: message[0])!
    
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let dateString = dateFormatter.string(from: date)
    
    dateFormatter.dateFormat = "mm"
    let min = dateFormatter.string(from: date)
    
    dateFormatter.dateFormat = "HH"
    let hour = dateFormatter.string(from: date)
    
    dateFormatter.dateFormat = "dd"
    let day = dateFormatter.string(from: date)
    
    let contents = message[2].isEmpty ? "<삭제된 메시지>" : message[2]
    
    let author = "[\(message[1])]"
    
    return Message(date: date, dateString: dateString, day: day, hour: hour, min: min, author: author, contents: contents)
}


func solution(_ commands: [String]) -> [Int] {
    
    var isOn = [[Int]: Bool]()
    var current = [0, 0]
    isOn[current] = true
    
    for command in commands {
        switch command {
        case "FORWARD":
            current[0] += 1
            isOn[current] = true
        case "UP":
            current[1] += 1
            isOn[current] = true
        case "BACK":
            let back = [current[0] - 1, current[1]]
            if back[0] < 0 { continue }
            if isOn[back] ?? false {
                isOn[current] = false
                current = back
            }
        case "DOWN":
            guard current[1] != 0 else { continue }
            
            while isOn[[current[0] - 1, current[1]]] ?? false {
                isOn[current] = false
                current[0] -= 1
            }
            isOn[current] = false
            current[1] -= 1
        default:
            break
        }
    }
    
    return current
}

func solution(_ plans: [String]) -> Int {
    let planDates = plans.map { parsePlan($0) }.sorted { $0[0] < $1[0] }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    var prevEnd = dateFormatter.date(from: "00:00")!
    
    var planCount = 0
    for plan in planDates {
        if plan[0] < prevEnd {
            prevEnd = min(prevEnd, plan[1])
        } else {
            planCount += 1
            prevEnd = plan[1]
        }
    }
    
    return planCount
}

func parsePlan(_ plan: String) -> [Date] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let planArr = plan.components(separatedBy: " ")
    return planArr.map { dateFormatter.date(from: $0)! }
}
