//
//  Brace.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/28.
//

import Foundation

func isRightBrace(_ p: String) -> Bool {
    let pArr = Array(p)
    var stack = [Character]()
    
    for i in 0..<pArr.count {
        if i > (pArr.count/2), pArr[i] == "(" {
            return false
        } else if pArr[i] == ")", stack.isEmpty {
            return false
        } else if pArr[i] == ")" {
            stack.removeLast()
        } else {
            stack.append(pArr[i])
        }
    }
    return true
}

func splitBrace(_ p: String) -> (String, String) {
    let pArr = Array(p)
    
    var u = [pArr[0]]
    
    for char in pArr[1..<pArr.count] {
        u.append(char)
        if isBalanced(u) { break }
    }
    
    return (String(pArr[0..<u.count]), String(pArr[u.count..<pArr.count]))
}

func isBalanced(_ p: [Character]) -> Bool {
    p.filter { $0 == "(" }.count == p.filter { $0 == ")" }.count
}

func makeRightBrace(_ p: String) -> String {
    if p.isEmpty { return p }
    if isRightBrace(p) { return p }
    var (u, v) = splitBrace(p)
    if isRightBrace(u) {
        return u + makeRightBrace(v)
    }
    return "(" + makeRightBrace(v) + ")" + reverseBrace(u)
}

func reverseBrace(_ p: String) -> String {
    var p = p
    p.removeFirst()
    p.removeLast()
    
    return String(p.map { $0 == "(" ? ")" : "(" })
}
