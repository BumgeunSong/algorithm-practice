//
//  Kakao.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/07.
//

import Foundation

func solution1(_ survey: [String], _ choices: [Int]) -> String {
    
    var score = Array(repeating: 0, count: 4)
    for i in survey.indices {
        score = countScore(survey[i], choices[i], score: score)
    }
    
    return generateString(score)
}

func countScore(_ survey: String, _ choice: Int, score: [Int]) -> [Int] {
    var score = score
    let choice = choice - 4
    
    switch survey {
    case "RT":
        score[0] += choice
    case "TR":
        score[0] -= choice
    case "CF":
        score[1] += choice
    case "FC":
        score[1] -= choice
    case "JM":
        score[2] += choice
    case "MJ":
        score[2] -= choice
    case "AN":
        score[3] += choice
    case "NA":
        score[3] -= choice
    default:
        break
    }
    
    return score
}

func generateString(_ score: [Int]) -> String {
    var result = ""
    result += score[0] > 0 ? "T" : "R"
    result += score[1] > 0 ? "F" : "C"
    result += score[2] > 0 ? "M" : "J"
    result += score[3] > 0 ? "N" : "A"
    return result
}


func solution2(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let queue = queue1 + queue2
    
    let q1sum = queue1.reduce(0, +)
    let sum = q1sum + queue2.reduce(0, +)
    if !sum.isMultiple(of: 2) { return -1 }
    
    let equal = sum / 2
    
    var start = 0
    var end = queue1.count
    
    var currentSum = q1sum
    var count = 0
    while start < end, start < queue.count, end < queue.count {
        if currentSum < equal {
            guard end < queue.count-1 else { return -1 }
            currentSum += queue[end]
            end += 1
        } else if currentSum > equal {
            guard start+1 < end else { return -1 }
            currentSum -= queue[start]
            start += 1
        } else {
            return count
        }
        count += 1
    }
    
    return -1
}

func solution3(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var timeCount = 0
    var currentAlp = alp
    var currentCop = cop
    
    var currentOptions = [[0,0,0,1,1], [0,0,1,0,1]]
    var currentTargets = problems
    
    currentTargets = currentTargets.filter { problem in
        if problem[0] <= currentAlp && problem[1] <= currentCop {
            currentOptions.append(problem)
            return false
        } else {
            return true
        }
    }
    
    while !currentTargets.isEmpty {
        let bestOptionIndex = bestJump(currentAlp, currentCop, currentTargets, currentOptions)
        
        let bestOption = currentOptions[bestOptionIndex]
        
        currentAlp += bestOption[2]
        currentCop += bestOption[3]
        timeCount += bestOption[4]
        
        currentTargets = currentTargets.filter { problem in
            if problem[0] <= currentAlp && problem[1] <= currentCop {
                currentOptions.append(problem)
                return false
            } else {
                return true
            }
        }
    }
    
    
    return timeCount
}

func getDistanceBetween(_ alp: Int, _ cop: Int, _ problems: [[Int]]) -> [[Int]] {
    return problems.map { problem in
        var newAlp = problem[0] - alp
        var newCop = problem[1] - cop
        newAlp = newAlp < 0 ? 0 : newAlp
        newCop = newCop < 0 ? 0 : newCop
        return [newAlp, newCop]
    }
}

func bestJump(_ alp:Int, _ cop:Int, _ problems: [[Int]], _ options: [[Int]]) -> Int {
    
    let distance = getDistanceBetween(alp, cop, problems)
    
    let priority = options.enumerated().map { index, option -> (index: Int, priority: Double) in
        let newDistance = getDistanceBetween(alp+option[2], cop+option[3], problems)
        
        let distanceSum = distance.reduce(0) { prev, distance in
            prev + distance[0] + distance[1]
        }
        
        let newDistanceSum = newDistance.reduce(0) { prev, distance in
            prev + distance[0] + distance[1]
        }
        
        let diff = distanceSum - newDistanceSum
        return (index, (Double(diff) / Double(option[4])))
    }
    
    return priority.sorted { $0.priority > $1.priority }[0].index
}







//
//
//struct QueueState: Hashable {
//    var array: [Int]
//    var startQ1: Int {
//        didSet { if startQ1 >= array.count { startQ1 -= array.count } }
//    }
//    var startQ2: Int {
//        didSet { if startQ2 >= array.count { startQ2 -= array.count } }
//    }
//    var lastQ1: Int {
//        didSet { if lastQ1 >= array.count { lastQ1 -= array.count } }
//    }
//    var lastQ2: Int {
//        didSet { if lastQ2 >= array.count { lastQ2 -= array.count } }
//    }
//    var diff: Int
//}
//
//func solution2(_ queue1:[Int], _ queue2:[Int]) -> Int {
//    var visited = [QueueState: Bool]()
//
//    let sumQ1 = queue1.reduce(0, +)
//    let sumQ2 = queue2.reduce(0, +)
//
//    let root = QueueState(array: queue1 + queue2,
//                          startQ1: 0,
//                          startQ2: queue1.count,
//                          lastQ1: queue1.count-1,
//                          lastQ2: queue1.count+queue2.count-1,
//                          diff: sumQ2 - sumQ1)
//
//    if !root.diff.isMultiple(of: 2) { return -1 }
//
//
//    guard (sumQ2 * -2) <= root.diff, root.diff <= (sumQ1 * 2) else { return -1 }
//
//
//    var toVisitLevel = [[root]]
//
//
//    var levelCount = 0
//    while !toVisitLevel.isEmpty {
//        let currentLevel = toVisitLevel.removeFirst()
//        var nextLevel = [QueueState]()
//
//        for i in currentLevel.indices {
//            let currentState = currentLevel[i]
//            if currentState.diff == 0 { return levelCount }
//
//            if visited[currentState] != nil { continue }
//            visited[currentState] = true
//
//            if currentState.startQ1 < currentState.lastQ1 {
//                var nextState = currentState
//
//                nextState.diff += (2 * currentState.array[currentState.startQ1])
//                nextState.startQ1 += 1
//                nextState.lastQ2 += 1
//
//                nextLevel.append(nextState)
//            }
//
//            if currentState.startQ2 < currentState.lastQ2 {
//                var nextState = currentState
//
//                nextState.diff -= (2 * currentState.array[currentState.startQ2])
//                nextState.startQ2 += 1
//                nextState.lastQ1 += 1
//
//                nextLevel.append(nextState)
//            }
//        }
//
//        if nextLevel.isEmpty { break }
//        toVisitLevel.append(nextLevel)
//        levelCount += 1
//    }
//
//    return -1
//}



