//
//  Heap.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/16.
//

import Foundation

struct Heap<Element: Comparable> {
    typealias Sort = (Element, Element) -> Bool
    var elements: [Element] = []
    var sort: Sort
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    
    // Peek - O(1)
    func peek() -> Element? { elements.first }
    
    func leftChildIndex(of index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        (index - 1) / 2
    }
    
    // Init - O(n log n)
    init(sort: @escaping Sort, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if elements.isEmpty { return }
        
        for i in stride(from: parentIndex(of: count), through: 0, by: -1) {
            shiftDown(from: i)
        }
    }
    
    // Remove - O(log n)
    mutating func remove() -> Element? {
        if elements.isEmpty { return nil }
        elements.swapAt(0, count-1)
        
        defer { shiftDown(from: 0) }
        
        return elements.removeLast()
    }
    
    mutating func shiftDown(from parent: Int) {
        let leftIndex = leftChildIndex(of: parent)
        let rightIndex = rightChildIndex(of: parent)
        
        var candidate = parent
        
        // 왼쪽 인덱스가 큰지 확인하고 canidate로 정함.
        if leftIndex < count, sort(elements[leftIndex], elements[candidate]) {
            candidate = leftIndex
        }
        
        // 오른쪽 인덱스 큰지 확인, 위에서 스왑했으면 더 왼쪽보다 더 큰지 확인하고 candidate로 정함.
        if rightIndex < count, sort(elements[rightIndex], elements[candidate]) {
            candidate = rightIndex
        }
        
        // 왼쪽, 오른쪽 인덱스가 올라오지 않았으면 그냥 리턴.
        if candidate == parent { return }
        
        // 후보군과 부모노드를 바꿈.
        elements.swapAt(parent, candidate)
        
        shiftDown(from: candidate)
    }
    
    // Insert - O(log n)
    mutating func insert(_ element: Element) {
        elements.append(element)
        shiftUp(from: elements.count-1)
    }
    
    mutating func shiftUp(from child: Int) {
        let parent = parentIndex(of: child)
        
        if child > 0, sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            shiftUp(from: parent)
        }
    }
    
    // Search - O(n)
    func index(of element: Element, startAt i: Int) -> Int? {
        if i >= count { return nil }
        if sort(element, elements[i]) { return nil }
        
        if element == elements[i] { return i }
        
        if let j = index(of: element, startAt: leftChildIndex(of: i)) { return j }
        if let j = index(of: element, startAt: rightChildIndex(of: i)) { return j }
        return nil
    }
}
