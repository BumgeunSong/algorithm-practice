//
//  Trie.swift
//  Algorithm_S4
//
//  Created by 송범근 on 2022/08/03.
//

import Foundation

class Trie {

    let root: TrieNode
    
    init() {
        self.root = TrieNode()
    }
    
    func insert(_ word: String) {
        var node = root
        
        for char in word {
            // 글자가 없으면 추가
            if !node.contains(char) {
                node.put(char, TrieNode())
            }
            // 다음 글자로 이동
            node = node.get(char)
        }
        
        // 마지막 글자에 표시
        node.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var node = root
        
        for char in word {
            // 글자가 있으면 다음 글자로 이동
            if node.contains(char) {
                node = node.get(char)
            } else {
                // 글자가 없으면 false
                return false
            }
        }
        // 마지막 글자에 표시가 있으면 true
        return node.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var node = root
        
        for char in prefix {
            // 글자가 있으면 다음 글자로 이동
            if node.contains(char) {
                node = node.get(char)
            } else {
                return false
            }
        }
        
        // 마지막 글자에 표시가 없어도 true
        return true
    }
}

class TrieNode {
    var isEnd: Bool
    var links: [Character: TrieNode]
    
    init() {
        self.isEnd = false
        self.links = [:]
    }
    
    func contains(_ character: Character) -> Bool {
        return links[character] != nil
    }
    
    func get(_ character: Character) -> TrieNode {
        return links[character]!
    }
    
    func put(_ character: Character, _ node: TrieNode) {
        links[character] = node
    }
}
