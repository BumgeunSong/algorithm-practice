//
//  GraphNode.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/02.
//

import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
