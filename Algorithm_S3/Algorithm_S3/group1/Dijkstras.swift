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

extension Vertex: Comparable where T: Comparable {
    static func < (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
        lhs.data == rhs.data && lhs.index == rhs.index
    }
}
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


class Dijkstra<T: Hashable & Comparable> {
    typealias Graph = AdjacencyList<T>
    let graph: Graph
    
    init(graph: Graph) {
        self.graph = graph
    }
    
    func route(to destination: Vertex<T>, with paths: [Vertex<T>: Visit<T>]) -> [Edge<T>] {
        // ?????????????????? ??????
        var vertex = destination
        var path: [Edge<T>] = []
        
        // ?????? ????????? Visit ????????? ?????????. ?????? .edge?????? ???????????? ??????.
        // ?????? path??? ?????? ????????? ?????? edge??? ??????
        // ?????? ????????? ????????? ?????????????????? ????????????.
        while let visit = paths[vertex], case .edge(let edge) = visit {
            path = [edge] + path
            vertex = edge.source
        }
        return path
    }
    
    func distance(to destination: Vertex<T>, with paths: [Vertex<T>: Visit<T>]) -> Double {
        let path = route(to: destination, with: paths)
        let distances = path.compactMap { $0.weight }
        return distances.reduce(0.0, +)
    }
    
    func shortestPath(from start: Vertex<T>) -> [Vertex<T>: Visit<T>] {
        // ?????? ????????? ?????? ????????? '??????'?????? ???????????? ??????.
        var paths: [Vertex<T>: Visit<T>] = [start: .start]
        
        var priorityQueue = PriorityQueue<Vertex<T>>(sort: {
            self.distance(to: $0, with: paths) < self.distance(to: $1, with: paths)
        })
        priorityQueue.enqueue(start)
    
        
        while let vertex = priorityQueue.dequeue() {
            // ?????? vertex??? ?????? edge??? ????????????.
            for edge in graph.edges(from: vertex) {
                // edge??? weight??? ????????? ??????.
                guard edge.weight != nil else { continue }
                
                // ?????? ????????? ???????????? ???????????? ????????? ????????? ?????????
                // ?????? ?????? ????????? ???????????? ???????????? ????????? ???
                // priority queue??? ??????????????????.
                if paths[edge.destination] == nil || distance(to: vertex, with: paths) < distance(to: edge.destination, with: paths) {
                    paths[edge.destination] = .edge(edge)
                    priorityQueue.enqueue(edge.destination)
                }
            }
        }
        return paths
    }
    
    func shortestPath(to destination: Vertex<T>, paths: [Vertex<T>: Visit<T>]) -> [Edge<T>] {
        return route(to: destination, with: paths)
    }
    
    func getAllShortestPath(from source: Vertex<T>) -> [Vertex<T>: [Edge<T>]] {
        var pathDict = [Vertex<T>: [Edge<T>]]()
        
        let paths = shortestPath(from: source)
        for vertex in graph.vertices {
            pathDict[vertex] = shortestPath(to: source, paths: paths)
        }
        
        return pathDict
    }
}

/*
 ??????????????? ??????????????? ?????? ?????????
 
 
 */

