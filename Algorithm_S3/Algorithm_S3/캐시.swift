//
//  캐시.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/18.
//

import Foundation

func 캐시(_ cacheSize: Int, _ cities: [String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }

    var cache = LRUCache<String>(size: cacheSize)

    return cities.reduce(0) { partialResult, city in
        let city = city.lowercased()
        if cache.find(city) {
            return partialResult+1
        } else {
            return partialResult+5
        }
    }
}

struct LRUCache<T: Hashable> {
    // cache dict를 가지고 있음.
    var cache = [T: LinkedListNode<T>]()
    
    // cache list를 가지고 있음.
    var leastUsedList = LinkedList<T>()
    
    // cache size를 가지고 있음.
    var cacheSize: Int
    
    init(size: Int) {
        cacheSize = size
    }
    
    mutating func find(_ value: T) -> Bool {
        if let hit = cache[value] {
            leastUsedList.append(leastUsedList.remove(node: hit))
            return true
        } else {
            cache[value] = LinkedListNode(val: value)
            leastUsedList.append(value)
            
            if cache.count > cacheSize {
                cache[leastUsedList.remove(node: leastUsedList.head!)] = nil
            }
            return false
        }
    }
    
    // 특정 데이터가 들어왔을 때,
    // cache dict에서 찾아본 후 미스/히트 판단
    
    // 미스라면, cache dict에 추가. cache list에 추가. cache list 사이즈가 정해진 것 이상이면, cache list 맨 앞 삭제
    
    // 히트라면, cache dict에서 가져온 노드 참조를 가지고 cache list에서 삭제 후 맨 뒤에 추가.
}


public class LinkedListNode<T> {
    var val: T
    var prev: LinkedListNode?
    weak var next: LinkedListNode?
    
    init(val: T) { self.val = val }
}

public class LinkedList<T> {
    typealias Node = LinkedListNode<T>
    
    var head: Node?
    var tail: Node?
    
    var count: Int = 0
    
    func append(_ value: T) {
        let newNode = Node(val: value)
        append(newNode)
    }
    
    func append(_ newNode: Node) {
        if let tail = tail {
            newNode.prev = tail
            tail.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
        count += 1
    }
    
    func remove(node: Node) -> T {
        
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        if let next = next {
            next.prev = prev
        } else {
            tail = prev
        }
        
        node.prev = nil
        node.next = nil
        
        return node.val
    }
}
