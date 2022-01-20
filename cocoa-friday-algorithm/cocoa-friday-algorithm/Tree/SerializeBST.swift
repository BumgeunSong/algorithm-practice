//
//  SerializeBST.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/18.
//

import Foundation

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        
        func levelorder(_ root: TreeNode?) -> [[Int?]] {
            var answer: [[Int?]] = []
            if root == nil { return answer }
            var currentlevel = [root]
            
            while !currentlevel.compactMap({ $0 }).isEmpty {
                var currentVal: [Int?] = []
                var nextLevel: [TreeNode?] = []
                
                for node in currentlevel {
                    if let node = node {
                        currentVal.append(node.val)
                        nextLevel.append(node.left)
                        nextLevel.append(node.right)
                    } else {
                        currentVal.append(nil)
                    }
                    
                }
                answer.append(currentVal)
                currentlevel = nextLevel
            }
            return answer
        }
        
        let levelorder = levelorder(root)
        
        var string = [String]()
        for level in levelorder {
            string.append(level.map { val in
                if val != nil { return "\(val!)" }
                else { return "#" }
            }.joined(separator: ","))
        }
        
        return string.joined(separator: "/")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let levelArray = data.components(separatedBy: "/")
            .map { $0.components(separatedBy: ",") }
        
        let levelTree = levelArray.map { level in
            level.map { str in
                return Int(str) != nil ? TreeNode(Int(str)!) : nil
            }
        }
        
        guard let root = levelTree.first?.first else {
            return nil
        }
        
        let prevLevel = [root]
        
        for i in 0..<levelTree.count {
            for j in 0..<levelTree[i].count {
                if j % (levelTree[i].count / 2) == 0 {
                    
                } else {
                    
                }
                levelTree[i-1][j % levelTree.count]
            }
        }
    
       return TreeNode(1)
    }
}
