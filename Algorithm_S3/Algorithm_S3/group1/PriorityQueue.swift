//
//  PriorityQueue.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/22.
//

import Foundation
import Metal

protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct PriorityQueue<Element: Comparable>: Queue {
    @discardableResult mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    @discardableResult mutating func dequeue() -> Element? {
        return heap.remove()
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
    
    var peek: Element? {
        heap.peek()
    }
    
    var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.heap = Heap(sort: sort, elements: elements)
    }
}
