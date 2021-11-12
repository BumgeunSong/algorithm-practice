//
//  main.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

print("Let's get started")

// 반복해서 실행 코드를 적고 있다는 사실을 깨달았다.
// 숫자만 입력하면 자동으로 문제로 이동하는 함수 goToProblem() 를 만들고 싶었다.
// 그런데 오히려 더 복잡해져버렸다.
// 동적으로 struct 이름을 부르고 싶은데 파라미터 -> struct name 이 안 되는 거 같다.
// Case로 분기문을 쓰자니, struct type이 여러개여서 중복이 안 줄어든다.
// 어떻게 간단한 코드로 중복을 줄일 수 있을까?

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

print(whichDayIn2016(5, 24))

