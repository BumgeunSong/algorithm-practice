//
//  main.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

print("Let's get started")

func goToProblem(number: Int) {
    print("This is problem \(number)")
    print("Give me an input:")
    
    switch number {
    case 1000:
        let problem = Problem1000()
        problem.start()
    case 1008:
        let problem = Problem1008()
        problem.start()
    case 2438:
        let problem = Problem2438()
        problem.start()
    case 2920:
        let problem = Problem2920()
        problem.start()
    case 8958:
        let problem = Problem8958()
        problem.start()
    case 11654:
        let problem = Problem11654()
        problem.start()
    default:
        print("Not a valid Number")
    }
}


//MARK: - Problem 1000
//
//print("Problem 1000")
//print("Give me an input:")
//let problem1000 = Problem1000()
//problem1000.simpleStart()

//MARK: - Problem 1008

//print("Problem 1008")
//print("Give me an input:")
//let problem1008 = Problem1008()
//problem1008.start()

//MARK: - Problem 2438

//print("Problem 2438")
//print("Give me an input:")
//let problem2438 = Problem2438()
//problem2438.start()

//MARK: - Problem 2920
//goToProblem(number: 2920)

//MARK: - Problem 8958
//goToProblem(number: 8958)

//MARK: - Problem 11654
//goToProblem(number: 11654)

//MARK: - 크레인 인형뽑기 게임

let board1 = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let moves1 = [1,5,3,5,1,2,1,4]
//print(craneGame(board1, moves1))


//MARK: - 두 개 뽑아서 더하기

let numbers1 = [2,1,3,4,1]
let numbers2 = [5,0,2,7]
//print(pick2Add(numbers1), "should be [2,3,4,5,6,7]")
//print(pick2Add(numbers2), "should be [2,5,7,9,12]")

//MARK: - 모의고사

let answers1 = [1,2,3,4,5]
let answers2 = [1,3,2,4,2]
//print(test(answers1), " = [1]")
//print(test(answers2), " = [1,2,3]")

//MARK: - 2016년

//print(whichDayIn2016(5, 24))

//MARK: - 약수의 합

//print(sumDivisor(12), "should be 28")
//print(sumDivisor(5), "should be 6")
//print(sumDivisor(0), "should be 0")


// MARK: - Time Conversion
//
//print(timeConversion(s: "12:00:00AM"))
//print(timeConversion(s: "12:00:00PM"))
//print(timeConversion(s: "09:00:00AM"))
//print(timeConversion(s: "09:00:00PM"))
//

//print(kangaroo(x1: 0, v1: 2, x2: 5, v2: 3))


// MARK: - Valid Sudoku

//var board: [[Character]] =
//[["5","3",".",".","7",".",".",".","."]
//,["6",".",".","1","9","5",".",".","."]
//,[".","9","8",".",".",".",".","6","."]
//,["8",".",".",".","6",".",".",".","3"]
//,["4",".",".","8",".","3",".",".","1"]
//,["7",".",".",".","2",".",".",".","6"]
//,[".","6",".",".",".",".","2","8","."]
//,[".",".",".","4","1","9",".",".","5"]
//,[".",".",".",".","8",".",".","7","9"]]
//
//print(isValidSudoku(board))
//
//board = [
//    ["8","3",".",".","7",".",".",".","."],
//    ["6",".",".","1","9","5",".",".","."],
//    [".","9","8",".",".",".",".","6","."],
//    ["8",".",".",".","6",".",".",".","3"],
//    ["4",".",".","8",".","3",".",".","1"],
//    ["7",".",".",".","2",".",".",".","6"],
//    [".","6",".",".",".",".","2","8","."],
//    [".",".",".","4","1","9",".",".","5"],
//    [".",".",".",".","8",".",".","7","9"]
//]
//print(isValidSudoku(board))

//
//print(romanToInt("LVIII"))
//print(romanToInt("MCMXCIV"))

//print(longestCommonPrefix(["flower","flow","flight"]))

// print(invertTree(input))
//
//var input = TreeNode(6, p, TreeNode(8, TreeNode(7), TreeNode(9)))
//var q = TreeNode(4, TreeNode(3), TreeNode(5))
//var p = TreeNode(2, TreeNode(0), q)
//
//print(lowestCommonAncestor(input, p, q))

//print(lengthOfLongestSubstring("abcabcbb"))

let s1 = "ab", s2 = "eidbaooo"
print(checkInclusion(s1, s2))
