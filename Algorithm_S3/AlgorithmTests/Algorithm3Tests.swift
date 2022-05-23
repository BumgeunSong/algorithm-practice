//
//  Algorithm3Tests.swift
//  AlgorithmTests
//
//  Created by Bumgeun Song on 2022/05/07.
//

import XCTest

class Algorithm3Tests: XCTestCase {

    func testExample() throws {
        XCTAssertEqual(1+1, 2)
    }

    func testSolution1() throws {
        let input1 = ["AN", "CF", "MJ", "RT", "NA"]
        let input2 = [5, 3, 2, 7, 5]
        let answer = "TCMA"
        
        XCTAssertEqual(solution1(input1, input2), answer)
    }
    
    func testSolution1_2() throws {
        let input1 = ["TR", "RT", "TR"]
        let input2 = [7, 1, 3]
        let answer = "RCJA"
        
        XCTAssertEqual(solution1(input1, input2), answer)
    }
    
    func testSolution1_3() throws {
        let input1 = ["TR", "RT", "MJ", "JM"]
        let input2 = [4, 4, 4, 4 ]
        let answer = "RCJA"
        
        XCTAssertEqual(solution1(input1, input2), answer)
    }
    
    func testSolution2_1() throws {
        let input1 = [3, 2, 7, 2]
        let input2 = [4, 6, 5, 1]
        let answer = 2
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testSolution2_2() throws {
        let input1 = [1, 2, 1, 2]
        let input2 = [1, 10, 1, 2]
        let answer = 7
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testSolution2_3() throws {
        let input1 = [1, 1]
        let input2 = [1, 5]
        let answer = -1
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testSolution2_4() throws {
        let input1 = [3, 3, 3, 3]
        let input2 = [3, 3, 3, 3, 4]
        let answer = -1
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testSolution2_5() throws {
        let input1 = [1, 1, 1, 1] // 16
        let input2 = [9, 8, 9, 8] // 18
        let answer = -1
        
        XCTAssertEqual(solution2(input1, input2), answer)
    }
    
    func testBestJump() throws {
        let input1 = [[10,4,0,4,2], [4,11,4,0,2]]
        let input2 = [[0,0,0,1,1],[0,0,1,0,1],[0,0,2,1,2],[4,5,3,1,2]]
        let answer = 2
        
        let result = bestJump(4,5, input1, input2)
        XCTAssertEqual(result, answer)
    }
    
    func testSolution3_1() throws {
        let input1 = [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]]
        let answer = 13
        
        let result = solution3(0,0, input1)
        XCTAssertEqual(result, answer)
    }
    
    func testSolution3_2() throws {
        let input1 = [[0,0,3,3,4]]
        let answer = 0
        
        let result = solution3(0,0, input1)
        XCTAssertEqual(result, answer)
    }
    
    func test후보키() throws {
        let input1 = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]
        let answer = 2
        
        XCTAssertEqual(후보키(input1), answer)
    }
    
    func testIsUnique() throws {
        let input1 = [1,2,3]
        let input2 = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]
        XCTAssertEqual(isUniqueKey(input1, input2), true)
    }
    
    func testHashMap() throws {
        let myHashMap = MyHashMap()
        myHashMap.put(1, 1)
        myHashMap.put(2, 2)
        XCTAssertEqual(myHashMap.get(1), 1)
        XCTAssertEqual(myHashMap.get(3), -1)
        myHashMap.put(2, 1)
        XCTAssertEqual(myHashMap.get(2), 1)
        myHashMap.remove(2)
        XCTAssertEqual(myHashMap.get(2), -1)
    }

    func testHeap() throws {
        var heap = Heap<Int>(sort: >)
        heap.insert(1)
        heap.insert(5)
        heap.insert(9)
        heap.insert(7)
        heap.insert(6)
        heap.insert(2)
        
        print(heap.elements)
        heap.insert(10)
        heap.insert(4)
        print(heap.elements)
    }
    
    func testParseString() throws {
        let input1 = "{{2}, {2, 1}, {2, 1, 3}, {2, 1, 3, 4}}"
        let answer = [[2], [2,1], [2,1,3], [2,1,3,4]]
        
        XCTAssertEqual(parseString(input1), answer)
    }
    
    func testGetDiff() throws {
        let input1 = [1, 3, 6, 10]
        let answer = [2,3,4]
        
        XCTAssertEqual(getDiff(input1), answer)
    }
    
    func test튜플1() throws {
        let input1 = "{{1,2,3},{2,1},{1,2,4,3},{2}}"
        let answer = [2, 1, 3, 4]
        
        XCTAssertEqual(튜플(input1), answer)
    }
    
    func test튜플2() throws {
        let input1 = "{{123}}"
        let answer = [123]
        
        XCTAssertEqual(튜플(input1), answer)
    }

    func test캐시() throws {
        let input1 = ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]
        let input2 = 3
        let answer = 21

        XCTAssertEqual(캐시(input2, input1), answer)
    }

    func test캐시2() throws {
        let input1 = ["Jeju", "Pangyo", "NewYork", "newyork"]
        let input2 = 2
        let answer = 16

        XCTAssertEqual(캐시(input2, input1), answer)
    }
    
    func test캐시3() throws {
        let input1 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
        let input2 = 2
        let answer = 60

        XCTAssertEqual(캐시(input2, input1), answer)
    }
    
    func test캐시4() throws {
        let input1 = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]
        let input2 = 2
        let answer = 60

        XCTAssertEqual(캐시(input2, input1), answer)
    }
    
    func testNode() throws {
        var list = LinkedList<String>()
        list.append("A")
        XCTAssertEqual(list.head?.val, "A")
        XCTAssertEqual(list.tail?.val, "A")
        XCTAssertEqual(list.remove(node: list.head!), "A")
        XCTAssertNil(list.head)
        XCTAssertNil(list.tail)
        list.append("B")
        list.append("C")
        XCTAssertEqual(list.head?.val, "B")
        XCTAssertEqual(list.tail?.val, "C")
        XCTAssertEqual(list.remove(node: list.head!), "B")
        XCTAssertNotNil(list.head)
        XCTAssertNotNil(list.tail)
    }
    
    func testTimeInterval() throws {
        let input1 = "15:59"
        let input2 = "16:4"
        let answer = 5
        
        XCTAssertEqual(getTimeInterval(start: input1, end: input2), answer)
    }
    
    func testPlayedNote() throws {
        let input1 = ["C","C#","B"]
        let input2 = 10
        let answer = ["C","C#","B","C","C#","B","C","C#","B","C"]
        
        XCTAssertEqual(getPlayedNote(input1, input2), answer)
    }
    
    func testParseNote() throws {
        let input1 = "CC#BCC#BCC#B"
        let answer = ["C","C#","B","C","C#","B","C","C#","B"]
        
        XCTAssertEqual(parseNote(input1), answer)
    }
    
    func testInclude() throws {
        let input1 = ["B","C"]
        let input2 = ["C","C#","B","C","C#","B","C","C#","B"]
        let answer = true
        
        XCTAssertEqual(include(input1, input2), answer)
    }
    
    func test방금그곡() throws {
        let input1 = "ABCDEFG"
        let input2 = ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]
        let answer = "HELLO"
        XCTAssertEqual(방금그곡(input1, input2), answer)
    }
    
    func test방금그곡2() throws {
        let input1 = "CC#BCC#BCC#BCC#B"
        let input2 = ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]
        let answer = "FOO"
        XCTAssertEqual(방금그곡(input1, input2), answer)
    }
    
    func test방금그곡3() throws {
        let input1 = "DDD"
        let input2 = ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]
        let answer = "(None)"
        XCTAssertEqual(방금그곡(input1, input2), answer)
    }
    
    func testGenerateSequence() throws {
        let input1 = 2
        let input2 = 3
        let answer = ["000","001",
                      "010","011","100","101","110","111"]
        let digiString = makeDigitString(digit: 2)
        let sequence = sequence(digiString, toLength: input2)
        let array = makeCharArray(sequence)
        print(array)
        
        XCTAssertEqual(sequence, answer)
    }
    
    func testDigitString() throws {
        
        
//        XCTAssertEqual(makeDigitString(digit: input1), answer)
    }
    
    func test이진수게임() throws {
        let input1 = 2
        let input2 = 4
        let input3 = 2
        let input4 = 1
        let answer = "0111"
        
        XCTAssertEqual(이진수게임(input1, input2, input3, input4), answer)
    }
    func test이진수게임2() throws {
        let input1 = 16
        let input2 = 16
        let input3 = 2
        let input4 = 1
        let answer = "02468ACE11111111"
        
        XCTAssertEqual(이진수게임(input1, input2, input3, input4), answer)
    }
    
    func test이진수게임3() throws {
        let input1 = 16
        let input2 = 16
        let input3 = 2
        let input4 = 2
        let answer = "13579BDF01234567"
        
        XCTAssertEqual(이진수게임(input1, input2, input3, input4), answer)
    }
    
    func test이진수게임4() throws {
        let input1 = 2
        let input2 = 4
        let input3 = 2
        let input4 = 1
        let answer = "0111"
        
        XCTAssertEqual(이진수게임(input1, input2, input3, input4), answer)
    }
    
    func testMultiple() {
        print(2.isMultiple(of: 3))
    }
    
    func testTruckTour() {
        let input1 = [[1,5],[10,3], [3,4]]
        
        XCTAssertEqual(truckTour(petrolpumps: input1), 1)
    }
}
