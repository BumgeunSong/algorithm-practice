//
//  BinarySearchTree.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/05/15.
//

import Foundation

struct BinarySearchTree<Element: Comparable> {
    var root: BinaryNode<Element>?
    
    init() { }
    
    mutating func insert(_ value: Element) {
        root = insert(into: root, value)
    }
    
    private func insert(into root: BinaryNode<Element>?, _ value: Element) -> BinaryNode<Element> {
        guard let root = root else {
            return BinaryNode(val: value)
        }
        
        if root.val < value {
            root.right = insert(into: root.right, value)
        } else {
            root.left = insert(into: root.left, value)
        }
        
        return root
    }
    
    func contain(_ value: Element) -> Bool {
        return contain(root, value)
    }
    
    private func contain(_ root: BinaryNode<Element>?, _ value: Element) -> Bool {
        guard let root = root else { return false }
        
        if root.val < value {
            return contain(root.right, value)
        } else if root.val > value {
            return contain(root.left, value)
        } else {
            return true
        }
    }
    
    mutating func remove(_ value: Element) {
        self.root = remove(root, value)
    }
    
    private func swapLeftBound(_ root: BinaryNode<Element>) -> BinaryNode<Element>? {
        
        switch (root.left, root.right){
        case (nil, nil):
            return nil
        case (_, nil):
            return root.left
        case (nil, _):
            return root.right
        case (_, _):
            root.val = getLargest(root.left!).val
            root.left = remove(root.left, root.val)
            return root
        }
    }
    
    private func remove(_ root: BinaryNode<Element>?, _ value: Element) -> BinaryNode<Element>? {
        guard let root = root else { return root }
        
        if root.val < value {
            root.right = remove(root.right, value)
            return root
        } else if root.val > value {
            root.left = remove(root.left, value)
            return root
        } else {
            return swapLeftBound(root)
        }
    }
    
    func getLargest(_ root: BinaryNode<Element>) -> BinaryNode<Element> {
        while let root = root.right { return getLargest(root) }
        return root
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let root = root else { return "empty tree" }
        
        var toVisitLevel = [[root]]
        var result = ""
        while !toVisitLevel.isEmpty {
            let currentLevel = toVisitLevel.removeFirst()
            var nextLevel = [BinaryNode<Element>]()
            for node in currentLevel {
                result += "\(node.val) "
                if node.left != nil { nextLevel.append(node.left!) }
                if node.right != nil {
                    nextLevel.append(node.right!)
                }
            }
            result += "\n"
            if !nextLevel.isEmpty { toVisitLevel.append(nextLevel) }
        }
        return result
    }
}

class BinaryNode<T> {
    init(val: T) { self.val = val }
    
    var val: T
    var left: BinaryNode?
    var right: BinaryNode?
}
