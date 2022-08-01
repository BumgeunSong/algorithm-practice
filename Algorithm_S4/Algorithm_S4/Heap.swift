//
//  Heap.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/31.
//

import Foundation


struct Heap<T: Comparable> {
    var elements: [T] = []
    var count: Int {
        return elements.count
    }
    var peek: T? {
        if elements.isEmpty { return nil }
        else { return elements[0] }
    }
    
    init(array: [T] = []) {
        configureHeap(from: array)
    }
    
    mutating func configureHeap(from array: [T]) {
        elements = array
        for i in stride(from: (count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    func leftChildIndex(of i: Int) -> Int {
        return (2 * i) + 1
    }
    
    func rightChildIndex(of i: Int) -> Int {
        return (2 * i) + 2
    }
    
    func parentIndex(of i: Int) -> Int {
        return i / 2
    }
    
    mutating func shiftDown(_ i: Int) {
        let left = leftChildIndex(of: i)
        let right = rightChildIndex(of: i)
        
        var head = i
        if left < count, elements[left] > elements[head] {
            head = left
        }
        if right < count, elements[right] > elements[head] {
            head = right
        }
        
        if head == i { return }
        elements.swapAt(i, head)
        shiftDown(head)
    }
    
    mutating func shiftUp(_ i: Int) {
        var childIndex = i
        let child = elements[childIndex]
        var parentIndex = self.parentIndex(of: i)
        
        
        while childIndex > 0 && elements[childIndex] > elements[parentIndex] {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
        
        elements[childIndex] = child
    }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        shiftUp(elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        let topValue = elements[0]
        elements[0] = elements.removeLast()
        shiftDown(0)
        return topValue
    }
}
