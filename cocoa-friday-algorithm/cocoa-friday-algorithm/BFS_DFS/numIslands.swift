//
//  numIslands.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/02/14.
//

import Foundation

/*
 문제
 - m x n 2D grid가 주어진다.
 - 이 grid는 0과 1로 이뤄져있다.
 - 1은 땅, 0은 물을 의미한다.
 - 섬은 4방향이 물로 둘러쌓여있고, 가로 세로로 인접한 땅으로 이뤄져있다.
 - 섬의 숫자를 구하라.
 */

/*
 풀이
 - grid 전체를 (0,0) 부터 하나씩 1인지 확인한다.
 - 0이면 다음으로 넘어간다.
 - 1이면 BFS를 시작한다. 이 때 섬 숫자를 count+1한다.
 - visited queue을 만들고 하나씩 꺼내는 방식으로 선회한다.
 - 현재 방문한 노드는 0으로 바꾼다. (재방문 방지)
 - 인접한 4방향 노드 중 grid 안에 속하고, 0이 아닌 노드를 queue에 추가한다.
 - 중요한 점은, queue에서 꺼내는 시점이 아니라, queue에 집어넣는 시점에서 방문 표시를 해줘야 한다.
 - 아니면 집어넣고, 꺼내는 시점 사이에 같은 노드를 또 추가할 가능성이 있다.
 */

func numIslands(_ grid: [[String]]) -> Int {
    if grid.count <= 0 || grid[0].count <= 0 { return 0 }
    
    var islandCount = 0
    var grid = grid
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] == "1" {
                islandCount += 1
                addVisited(&grid, i, j)
            }
        }
    }
    return islandCount
}

func addVisited(_ grid: inout [[String]], _ i: Int, _ j: Int) {
    if (0..<grid.count).contains(i) && (0..<grid[0].count).contains(j) && grid[i][j] == "1" {
        grid[i][j] = "0"
        addVisited(&grid, i-1, j)
        addVisited(&grid, i+1, j)
        addVisited(&grid, i, j-1)
        addVisited(&grid, i, j+1)
    }
}
