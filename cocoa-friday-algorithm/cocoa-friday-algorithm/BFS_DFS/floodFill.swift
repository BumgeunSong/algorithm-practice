//
//  floodFill.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/09.
//

import Foundation

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    let color = image[sr][sc]
    var image = image
    if color != newColor { dfs(&image, sr, sc, color, newColor) }
    return image
}

func dfs(_ image: inout [[Int]], _ r: Int, _ c: Int, _ color: Int, _ newColor: Int) {
    if image[r][c] != color { return }
    image[r][c] = newColor
    if r - 1 >= 0 { dfs(&image, r - 1, c, color, newColor) }
    if r + 1 < image.count { dfs(&image, r + 1, c, color, newColor) }
    if c - 1 >= 0 { dfs(&image, r, c - 1, color, newColor) }
    if c + 1 < image[0].count { dfs(&image, r, c + 1, color, newColor) }
}



