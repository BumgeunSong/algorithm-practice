//
//  connect.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/10.
//

import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
      public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

// Populating Next Right Pointers in Each Node [Medium]

func connect(_ root: Node?) -> Node? {
    var unvisitedLevel = [[root]]
    while !unvisitedLevel.isEmpty {
        print(unvisitedLevel)
        let currentLevel = unvisitedLevel.removeFirst()
        var nextLevel: [Node?] = []
        for i in 0..<currentLevel.count {
            currentLevel[i]?.next = i == currentLevel.count - 1 ? nil : currentLevel[i+1]
            if currentLevel[i]?.left != nil { nextLevel.append(currentLevel[i]?.left) }
            if currentLevel[i]?.right != nil { nextLevel.append(currentLevel[i]?.right) }
        }
        if nextLevel.isEmpty { break }
        unvisitedLevel.append(nextLevel)
    }
    return root
}
