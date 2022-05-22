//
//  Dijkstras.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/21.
//

import Foundation


struct Edge<T> {
    let source: Vertex<T>
    let destination: Vertex<T>
    let weight: Double?
}

struct Vertex<T> {
    let index: Int
    let data: T
}

extension Vertex: Equatable where T: Equatable {}
extension Vertex: Hashable where T: Hashable {}

extension Vertex: CustomStringConvertible {
    var description: String { "\(data)" }
}

protocol Graph {
    associatedtype Element
    var vertices: [Vertex<Element>] { get }
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
      func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
      func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
      func edges(from source: Vertex<Element>) -> [Edge<Element>]
      func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}

extension Graph {
    func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch edge {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(between: source, and: destination, weight: weight)
        }
    }
}

enum EdgeType {
    case directed
    case undirected
}

class AdjacencyList<T: Hashable>:Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    
    init() { }
    
    var vertices: [Vertex<T>] {
        Array(adjacencies.keys)
    }
    
    func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(index: adjacencies.count, data: data)
        adjacencies[vertex] = []
        return vertex
    }
    
    func addDirectedEdge(from: Vertex<T>, to: Vertex<T>, weight: Double?) {
        let edge = Edge(source: from, destination: to, weight: weight)
        adjacencies[from]?.append(edge)
    }
    
    func edges(from: Vertex<T>) -> [Edge<T>]{
        return adjacencies[from] ?? []
    }
    
    func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        adjacencies[source]?.first { $0.destination == destination }?.weight
    }
}



enum Visit<T: Hashable> {
    case start
    case edge(Edge<T>)
}


class Dijkstra<T: Hashable> {
    typealias Graph = AdjacencyList<T>
    let graph: Graph
    
    init(graph: Graph) {
        self.graph = graph
    }
}
