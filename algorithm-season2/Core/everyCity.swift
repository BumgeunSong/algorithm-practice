//
//  everyCity.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/11.
//

import Foundation

func everyCity(_ tickets: [[String]]) -> [String] {
    
    var graph = tickets.reduce(into: [String: [String]]()) { partialResult, ticket in
        partialResult[ticket[0], default: []] += [ticket[1]]
        partialResult[ticket[0]]?.sort { $0 > $1 }
    }
    
    var stack = ["ICN"]
    var path: [String] = []
    
    while !stack.isEmpty {
        let top = stack.last!
        if graph[top] == nil { path.append(stack.popLast()!) }
        else if graph[top]!.isEmpty { path.append(stack.popLast()!) }
        else { stack.append(graph[top]!.popLast()!) }
    }
    
    return path.reversed()
    
}
