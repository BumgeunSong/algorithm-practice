//
//  findCircleNum.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/15.
//

import Foundation

/*
 문제
 - n개의 도시가 있다. 연결된 도시도 있고 아닌 도시도 있다.
 - a-b가 연결되어있고, b-c가 연결되어있다면 a-c는 간접적으료 연결되어있다.
 - province는 서로 연결되어있는 도시의 조합이다.
 - n x n matrix가 주어진다.
 - isConnected[i][j]=1은 i-j 도시가 연결되어있음을 나타낸다.
 - province의 총 숫자를 구해라.
 */

/*
 풀이
 - isConnected의 모든 node를 loop로 순회한다.
 - 자기 자신과의 연결이 끊겨있으면 continue
 - 자기 자신을 제외하고 연결된 node가 있는지 확인한다.
 - 자기 자신과의 연결을 끊는다.
 - node에 연결된 node가 있으면 서로의 edge를 삭제한다.
 - 해당 노드를 인자로 넘겨서 재귀 호출한다.
 - 자기 자신을 제외하고 연결된 노드가 없으면, 자기 자신과의 연결을 끊은 뒤 return 한다.
 - DFS가 모두 끝나면 count를 하나 올린다.
 - edge가 삭제된 matrix 상태로 다음 node로 이동한다.
 */

func findCircleNum(_ isConnected: [[Int]]) -> Int {
    var numOfProvince = 0
    var matrix = isConnected
    
    for row in 0..<matrix.count where matrix[row][row] == 1 {
        dfs(row, &matrix)
        numOfProvince += 1
    }
    
    return numOfProvince
}

func dfs(_ row: Int, _ matrix: inout [[Int]]) {
    // check as visited
    matrix[row][row] = 0
    
    for col in 0..<matrix[row].count where matrix[row][col] == 1 {
        // delete edge
        matrix[row][col] = 0
        matrix[col][row] = 0
        
        // visit connected city
        dfs(col, &matrix)
    }
}
