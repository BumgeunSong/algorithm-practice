//
//  캐시.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/18.
//

import Foundation

func 캐시(_ cacheSize: Int, _ cities: [String]) -> Int {
    
    /*
     먼저 Cache가 Hit인지 Miss인지 확인한다.
     
     캐시가 Hit인 경우
     - 실행 시간이 1 걸린다.
     - Hit한 캐시를 삭제하고, 맨 뒤에 추가한다.
     
     캐시가 Miss인 경우
     - 실행 시간이 5걸린다.
     - Miss한 캐시를 맨 뒤에 추가한다.
     - 이 때 캐시가 캐시 사이즈 이상으로 넘어간 경우, 맨 앞의 캐시를 삭제해준다.
     
     캐시 사이즈가 0인 경우
     - *5를 return한다.
    */
    
    if cacheSize == 0 { return cities.count * 5 }
    
    var cache = Cache<String>(maxSize: cacheSize)
    
    return cities.map{ $0.lowercased() }.reduce(0) { partialResult, city in
        defer { cache = updateCache(city, cache: cache) }
        return partialResult + searchCache(city, cache: cache)
    }
}

struct Cache<T: Hashable> {
    var queue: [T] = []
    var set: Set<T> = []
    let maxSize: Int
}


func searchCache<T: Hashable>(_ data: T, cache: Cache<T>) -> Int {
    return cache.set.contains(data) ? 1 : 5
}

func updateCache<T: Hashable>(_ data: T, cache: Cache<T>) -> Cache<T> {
    var cache = cache
    
    if cache.set.contains(data) {
        cache.queue.removeAll { $0 == data }
        cache.queue.append(data)
    } else {
        cache.queue.append(data)
        cache.set.insert(data)
    }
    
    if cache.queue.count > cache.maxSize {
        cache.set.remove(cache.queue.removeFirst())
    }
    
     return cache
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
