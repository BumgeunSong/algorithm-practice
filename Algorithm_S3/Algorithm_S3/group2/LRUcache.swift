//
//  LRUcache.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/10.
//

import Foundation

//class Node{
//    var pre: Node?
//    var next: Node?
//    var key: Int
//    var value: Int
//    init(_ key: Int, _ value: Int){
//        self.key = key
//        self.value = value
//    }
//}
//
//class LRUCache_sample {
//    var capacity: Int
//    var head: Node?
//    var tail: Node?
//    var count: Int
//    var map: [Int : Node]
//    init(_ capacity: Int) {
//        self.capacity = capacity
//        head = Node(-1, -1)
//        tail = Node(-1, -1)
//        head?.next = tail
//        tail?.pre = head
//        count = 0
//        map = [Int: Node]()
//    }
//
//    func moveToHead(_ node: Node?){
//        node?.next = head?.next
//        head?.next?.pre = node
//        node?.pre = head
//        head?.next = node
//    }
//
//    func deleteNode(_ node: Node?){
//        node?.next?.pre = node?.pre
//        node?.pre?.next = node?.next
//    }
//
//    func get(_ key: Int) -> Int {
//        if(map[key] == nil){
//            return -1
//        }
//        var node = map[key]
//        deleteNode(node)
//        moveToHead(node)
//        return node!.value
//    }
//
//    func put(_ key: Int, _ value: Int) {
//
//        if(map[key] != nil){
//            var node = map[key]
//            node?.value = value
//            deleteNode(node)
//            moveToHead(node)
//            return
//        }
//
//        var node = Node(key, value)
//        map[key] = node
//        if(count == capacity){
//            var delete = tail?.pre
//            deleteNode(delete)
//            map[delete!.key] = nil
//            count -= 1
//        }
//        moveToHead(node)
//        count+=1
//
//    }
//}


class DoublyListNode<T> {
    init(prev: DoublyListNode<T>? = nil, next: DoublyListNode<T>? = nil, key: T, val: T) {
        self.prev = prev
        self.next = next
        self.val = val
        self.key = key
    }
    
    weak var prev: DoublyListNode?
    var next: DoublyListNode?
    var key: T
    var val: T
}

class LRUCache_2 {
    
    var dict = [Int: DoublyListNode<Int>]()
    private var head: DoublyListNode<Int>
    private var tail: DoublyListNode<Int>
    private var listSize: Int = 0
    private var capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.head = DoublyListNode(key: -1, val: -1)
        self.tail = DoublyListNode(key: -1, val: -1)
        head.next = tail
        tail.prev = head
        tail.next = nil
    }
    
    func get(_ key: Int) -> Int {
        guard let node = dict[key] else { return -1 }
        
        remove(node)
        addToHead(node)
        
        return node.val
    }
    
    func addToHead(_ node: DoublyListNode<Int>) {
        node.next = head.next
        head.next?.prev = node
        
        head.next = node
        node.prev = head
        
        dict[node.key] = node
        listSize += 1
    }
    
    func remove(_ node: DoublyListNode<Int>) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        dict[node.key] = nil
        listSize -= 1
    }
    
    func deleteTail() {
        remove(tail.prev!)
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            node.val = value
            remove(node)
            addToHead(node)
            return
        }
        
        let newNode = DoublyListNode(key: key, val: value)
        dict[key] = newNode
        
        addToHead(newNode)
        
        if listSize > capacity {
            deleteTail()
        }
    }
}

extension LRUCache_2: CustomStringConvertible {
    var description: String {
        var result = ""
        var p: DoublyListNode? = head
        while p != nil {
            result += "(\(p!.key), \(p!.val)) -> "
            p = p?.next
        }
        return result + "X"
    }
}
