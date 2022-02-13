//
//  shortestPathBinaryMatrix.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/12.
//

import Foundation

// 문제
// n x n 크기의 Binary Matrix가 주어진다.
// 가장 짧은 Clear path를 return 하라.
// Clear path는 Top-left (0,0)에서 Bottom-right까지 가는 path다.
// Clear path는 0만 지나갈 수 있다.
// path는 상하좌우 뿐만 아니라 대각선까지 총 8방향으로 움직일 수 있다.
// path의 길이는 거쳐간 셀의 숫자다.
// path가 없으면 -1을 return 하라.

// 풀이
// 가장 짧은 path를 찾는 알고리즘.
// 일단 인접 셀을 모두 확인한다. 그리고 0이 있는 곳만 필터링한다.
// 만약 오른쪽 아래가 0이 있으면 무조건 거기가 우선순위다.
// 1순위 : 오른쪽 아래 / 2순위 아래, 오른쪽 .. 이런 식으로 순회를 한다.
// 만약 위의 순위가 있으면 뒤의 순위는 하지 않는다. 어차피 거기가 더 빠를 거기 때문에
// 셀을 한단계 옮길 때마다 length에 +1을 한다.
// 베이스 조건(Bottom-right)에 걸리면, length를 업데이트하고, 최종적으로 length를 return한다.

func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
    let directions = [[0, 1], [0, -1], [1, 0], [-1, 0],[-1, -1], [1, -1], [-1, 1], [1, 1]]
    if grid[0][0] == 1 { return -1 }
    let n = grid.count
    
    var grid = grid
    var q: [(x:Int, y:Int)] = [(0,0)]
    grid[0][0] = 1
    var path = 1
    
    while !q.isEmpty {
        
        for _ in 0..<q.count {
            let coord = q.removeFirst()
            if coord.x == n-1 && coord.y == n-1 { return path }
            
            directions.map({ dir -> (x:Int, y:Int) in
                return (coord.x + dir[0], coord.y + dir[1])
            }).filter { (x,y) in
                return x >= 0 && x < n && y >= 0 && y < n && grid[y][x] == 0
            }.forEach { (x,y) in
                q.append((x,y))
                grid[y][x] = 1
            }
        }
        path += 1
    }
    return -1
}
