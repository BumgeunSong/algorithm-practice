//
//  CoreAlgorithm.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/04.
//

import Foundation

class EdgeList<T>: CustomStringConvertible where T: Hashable {
    var vertex: Vertex<T>
    var edges: [Edge<T>]? = []
    
    init(vertex: Vertex<T>) {
        self.vertex = vertex
    }
    
    func addEdge(_ edge: Edge<T>) {
        edges?.append(edge)
    }
    
    var description: String {
        "Vertex \(vertex) -> \(edges ?? [])"
    }
}

class Graph<T>: CustomStringConvertible where T: Hashable {
    var list: [EdgeList<T>] = []
    
    func createVertex(_ data: T) -> Vertex<T> {
        if let same = list.last(where: { edgelist in
            edgelist.vertex.data == data
        }) {
            return same.vertex
        }
        
        let vertex = Vertex(index: list.count, data: data)
        list.append(EdgeList(vertex: vertex))
        return vertex
    }
    
    func addDirectedEdge(from vertex1: Vertex<T>, to vertex2: Vertex<T>, weight: Double? = nil) {
        let directedEdge = Edge(from: vertex1, to: vertex2, weight: weight)
        list[vertex1.index].addEdge(directedEdge)
    }
    
    func addUndirectedEdge(vertex1: Vertex<T>, to vertex2: Vertex<T>, weight: Double? = nil) {
        let edgeFrom1 = Edge(from: vertex1, to: vertex2, weight: weight)
        let edgeFrom2 = Edge(from: vertex2, to: vertex1, weight: weight)
        list[vertex1.index].addEdge(edgeFrom1)
        list[vertex2.index].addEdge(edgeFrom2)
    }
    
    var description: String {
        return list.reduce("") { partialResult, edgeList in
            return partialResult + "\(edgeList)\n"
        }
    }
}

struct Edge<T>: CustomStringConvertible where T: Hashable {
    let from: Vertex<T>
    let to: Vertex<T>
    let weight: Double?
    
    var description: String {
        "(\(to), \(weight ?? 1))"
    }
}

struct Vertex<T>: CustomStringConvertible where T: Hashable {
    let index: Int
    var data: T
    
    var description: String {
        "\(index): \(data)"
    }
}


struct Core {
    func quickSort(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 { return nums }
        
        let pivot = nums[Int.random(in: 0..<nums.count)]
        let less = nums.filter { $0 < pivot }
        let more = nums.filter { $0 > pivot }
        
        return quickSort(less) + [pivot] + quickSort(more)
    }
    
    func test1() {
        URLSession.shared.dataTask(with: URL(string: "https://apple.com")!) { data, response, error in
            // .. data 처리
        }
    }
    
}
