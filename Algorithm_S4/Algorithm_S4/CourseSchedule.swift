//
//  CourseSchedule.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/08/02.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    // graph 만들기
    var graph = prerequisites.reduce(into: Array(repeating: [Int](), count: numCourses)) { partialResult, pre in
        let course = pre[0]
        let req = pre[1]
        partialResult[course] += [req]
    }
    
    var visited = Set<Int>()
    func dfs(course: Int) -> Bool {
        // 이미 방문했던 수업이면 cycle 발생
        if visited.contains(course) { return false }
        
        // 요구 수업이 없으므로 해당 course는 바로 수료 가능
        if graph[course].isEmpty { return true }
        
        // 수업 방문 처리
        visited.insert(course)
        
        // 요구사항 중 수료 불가능한 곳이 있으면 끝낼 수 없음.
        for next in graph[course] {
            if !dfs(course: next) { return false }
        }
        
        // 해당 수업을 다시 방문하지 않은 걸로 원상복구
        visited.remove(course)
        // 나중에 해당 수업을 볼 때 다시 dfs를 하지 않고 바로 true 리턴하도록 요구 수업 변경
        graph[course] = []
        return true
    }
    
    
    for course in 0..<numCourses {
        if !dfs(course: course) { return false }
    }
    
    return true
}
