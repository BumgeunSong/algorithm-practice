//
//  Parking_fee.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/02.
//

import Foundation

func parking_fee(_ fees:[Int], _ records:[String]) -> [Int] {
    let feePolicy = FeePolicy(fees)
    let records = records.map { parseRecord($0) }
    let totalTimes = totalTime(records)
    
    return calculateTotalFee(totalTimes, fee: feePolicy)
}

func totalTime(_ records: [Record]) -> [Int: TimeInterval] {
    var timeDict = [Int: [Date]]()
    
    for record in records {
        timeDict[record.id, default: []] += [record.date]
    }
    
    var totalTimeDict = [Int: TimeInterval]()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    let final = dateFormatter.date(from: "23:59")!
    
    for id in timeDict.keys {
        var inoutTime = timeDict[id]!
        
        if !inoutTime.count.isMultiple(of: 2) {
            inoutTime.append(final)
        }
        
        totalTimeDict[id] = stride(from: 0, to: inoutTime.count, by: 2).reduce(0) { partialResult, i in
            partialResult + inoutTime[i+1].timeIntervalSince1970 - inoutTime[i].timeIntervalSince1970
        }
    }
    
    return totalTimeDict
}

struct FeePolicy {
    let baseTime: Int
    let baseFee: Int
    let unitTime: Int
    let unitFee: Int
    
    init(_ fees: [Int]) {
        baseTime = fees[0]
        baseFee = fees[1]
        unitTime = fees[2]
        unitFee = fees[3]
    }
}

func calculateTotalFee(_ totalTimes: [Int: TimeInterval], fee: FeePolicy) -> [Int] {
    return totalTimes.keys.sorted().map { id in
        return calculateFee(totalTimes[id]!, fee: fee)
    }
}

func calculateFee(_ totalTime: TimeInterval, fee: FeePolicy) -> Int {
    let totalMinute = Int(totalTime) / 60
    
    if totalMinute <= fee.baseTime { return fee.baseFee }
    
    let overtime = totalMinute - fee.baseTime
    
    let overUnit = Int((Double(overtime) / Double(fee.unitTime)).rounded(.up))
    
    return fee.baseFee + overUnit * fee.unitFee
}

func parseRecord(_ string: String) -> Record {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    
    let inputArr = string.components(separatedBy: " ")
    let date = dateFormatter.date(from: inputArr[0])!
    let id = Int(inputArr[1])!
    let inOut = inputArr[2]
    
    return Record(date: date, id: id, inOut: inOut)
}

struct Record {
    let date: Date
    let id: Int
    let inOut: String
}


