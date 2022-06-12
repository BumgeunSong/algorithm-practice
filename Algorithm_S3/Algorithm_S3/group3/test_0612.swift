//
//  test_0612.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/12.
//

import Foundation

func sorting(_ p: [Int]) -> [Int] {
    var p = p
    var changes = Array(repeating: 0, count: p.count)
    for i in p.indices {
        var minIndex = i
        for j in i+1..<p.count {
            if p[j] < p[minIndex] { minIndex = j }
        }
        if i == minIndex { continue }
        
        changes[i] += 1
        changes[minIndex] += 1
        p.swapAt(i, minIndex)
    }
    
    return changes
}


func vip(_ periods:[Int], _ payments:[[Int]], _ estimates:[Int]) -> [Int] {
    
    let currentVIP: [Bool] = (0..<periods.count).map { index in
        let period = periods[index]
        let totalPayment = payments[index].reduce(0, +)
        return isVip(period, totalPayment: totalPayment)
    }
    
    let nextVIP: [Bool] = (0..<periods.count).map { index in
        let period = periods[index] + 1
        let totalPayment = payments[index].reduce(0, +) - payments[index][0] + estimates[index]
        return isVip(period, totalPayment: totalPayment)
    }
    
    var becomeVIP = 0
    var becomeNormal = 0
    
    (0..<periods.count).forEach { index in
        switch (currentVIP[index], nextVIP[index]) {
        case (true, false):
            becomeNormal += 1
        case (false, true):
            becomeVIP += 1
        default:
            break
        }
    }
    
    return [becomeVIP, becomeNormal]
}

func isVip(_ periods: Int, totalPayment: Int) -> Bool {
    if periods >= 60, totalPayment >= 600_000 {
        return true
    } else if periods >= 24, totalPayment >= 900_000 {
        return true
    } else {
        return false
    }
}


func planSearch(_ n:Int, _ plans:[String], _ clients:[String]) -> [Int] {
    let (dataLimit, services) = parsingPlan(plans)
    let serviceDict = makeDict(services)
    
    let (dataRequirement, serviceRequirement) = parsingClients(clients)
    
    return dataRequirement.indices.map { clientIndex in
        
        guard let minDataIndex = upperBound(dataLimit, target: dataRequirement[clientIndex]) else {
            return 0
        }
        
        
        guard let availableService = serviceDict[serviceRequirement[clientIndex]] else {
            return 0
        }
        
        guard let minServiceIndex = upperBound(availableService, target: minDataIndex) else {
            return 0
        }
        
        return availableService[minServiceIndex] + 1
    }
}

func parsingClients(_ clients: [String]) -> ([Int], [[Int]]) {
    var dataRequirement = [Int]()
    var serviceRequirement = [[Int]]()
    
    for client in clients {
        var arr = client.components(separatedBy: " ").map { Int($0)! }
        dataRequirement.append(arr.removeFirst())
        serviceRequirement.append(arr)
    }
    return (dataRequirement, serviceRequirement)
}

func parsingPlan(_ plans: [String]) -> ([Int], [[Int]]) {
    var dataLimit = [Int]()
    var existingService = [Int]()
    var services = [[Int]]()
    for plan in plans {
        var arr = plan.components(separatedBy: " ").map { Int($0)! }
        dataLimit.append(arr.removeFirst())
        let newServices = (existingService + arr).sorted()
        services.append(newServices)
        existingService = newServices
    }
    return (dataLimit, services)
}

func makeDict(_ services: [[Int]]) -> [[Int]: [Int]] {
    var dict = [[Int]: [Int]]()
    for i in services.indices {
        makeSubsets(services[i]).forEach { subset in
            dict[subset, default: []] += [i]
        }
    }
    return dict
}

func makeSubsets(_ nums: [Int]) -> [[Int]] {
    if nums.isEmpty { return [[]] }
    let pick = nums[0]
    let subsetsOfRemain = makeSubsets(Array(nums.dropFirst()))
    return subsetsOfRemain.map { [pick] + $0 } + subsetsOfRemain
}

func upperBound(_ nums: [Int], target: Int) -> Int? {
    if target < nums[0] { return 0 }
    if target > nums[nums.count-1] { return nil }
    
    var low = 0
    var high = nums.count
    
    while low < high {
        let mid = (low + high) / 2
        if target == nums[mid] {
            return mid
        } else if target > nums[mid] {
            low = mid + 1
        } else {
            high = mid
        }
    }
    return low
}


func 야영(_ grid:[String], _ k:Int) -> Int {
    let n = grid.count
    let m = grid[0].count
    let grid = grid.map { Array($0) }
    
    let rootLocation = Location((1,1), grid: grid, nights: 0, moves: 0)
    
    var toVisit: [Location] = [rootLocation]
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    visited[rootLocation.position.x-1][rootLocation.position.y-1] = true
    
    while !toVisit.isEmpty {
        // 방문 처리
        let current = toVisit.removeFirst()
        if current.position == (n, m) { return current.nights }
        
        var nightPlus = [Location]()
        var noNight = [Location]()
        
        // 인접 노드 추가 처리
        let dxdy = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        for (dx, dy) in dxdy {
            let newPos: Position = (current.position.x + dx, current.position.y + dy)
            
            // grid를 벗어나면 추가 X
            guard (1...n).contains(newPos.x) && (1...m).contains(newPos.y) else {
                continue
            }
            
            guard !visited[newPos.x-1][newPos.y-1] else {
                continue
            }
            
            let newLocation = Location(newPos, grid: grid, nights: current.nights, moves: current.moves+1)
            
            
            // 강이면 추가 X
            guard newLocation.type != 2 else {
                continue
            }
            
            // 현재 이동 거리가 제한 k와 같을 때
            // 야영을 +1한 숲, 평지 인접 노드만 추가
            if current.moves == k {
                var nightPlusLocation = newLocation
                nightPlusLocation.nights += 1
                nightPlusLocation.moves = 0
                nightPlus.append(nightPlusLocation)
                visited[nightPlusLocation.position.x-1][nightPlusLocation.position.y-1] = true
            }
            
            
            // 현재 이동 거리가 k보다 작을 때
            // 야영을 +0 한 숲, 평지 인접 노드를 추가
            // 야영을 +1 한 숲, 평지 인접 노드를 추가
            if current.moves < k {
                noNight.append(newLocation)
                visited[newLocation.position.x-1][newLocation.position.y-1] = true
                
                var nightPlusLocation = newLocation
                nightPlusLocation.nights += 1
                nightPlusLocation.moves = 0
                nightPlus.append(nightPlusLocation)
                visited[nightPlusLocation.position.x-1][nightPlusLocation.position.y-1] = true
            }
        }
        toVisit += noNight
        toVisit += nightPlus
        
    }
    
    return -1
}

struct Location: CustomStringConvertible {
    var position: Position
    var type: Int // 평지 0 숲 1 강 2
    var nights: Int // 총 야영 횟수
    var moves: Int // 하루에 이동한 횟수
    
    init(_ root: Position, grid: [[Character]], nights: Int, moves: Int) {
        self.position = root
        
        switch grid[root.x-1][root.y-1] {
        case ".": self.type = 0
        case "F": self.type = 1
        case "#" : self.type = 2
        default: self.type = -1
        }
        self.moves = moves
        self.nights = nights
    }
    
    var description: String {
        return "\(position), type: \(type), nights: \(nights), moves: \(moves)"
    }
}

typealias Position = (x: Int, y: Int)

