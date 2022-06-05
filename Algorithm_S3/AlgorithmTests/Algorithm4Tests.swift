//
//  Algorithm4Tests.swift
//  AlgorithmTests
//
//  Created by Bumgeun Song on 2022/05/26.
//

import XCTest

class Algorithm4Tests: XCTestCase {
    func testPermutation() throws {
        let input1 = [1,2,3,4]
        let input2 = 4
        print(permutation(nums: input1, sum: input2))
        
    }
    
    func testVerticalPermutation() throws {
        let input1 = permutation(nums: [1,2,3,4], sum: 4)
        let input2 = 2
        print(verticalPermutation(rows: input1, n: input2))
    }
    
    func testTotalCase() throws {
        let m = 5
        let n = 2
        let totalCases: [Int] = (1...m).map { 가로 in
            totalCase(가로: 가로, 높이: n)
        }
        print(totalCases)
    }
    
    func testBalancedSum() throws {
        let input1 = [1,2,3,3]
        let answer = 2
        
        XCTAssertEqual(balancedSum(arr: input1), answer)
    }
    
    func testisPossible() throws {
        
        let answer = "NO"
        
        XCTAssertEqual(isPossible(a: 1, b: 2, c: 3, d: 6), answer)
    }
    
    func testisPossible2() throws {
        
        let answer = "YES"
        
        XCTAssertEqual(isPossible(a: 1, b: 4, c: 5, d: 9), answer)
    }
    func testMinimumBribes() throws {
        let input1 = [1, 2, 5, 3, 4, 7, 8, 6]
        print(minimumBribes(q: input1))
    }
    func testCountBribes() throws {
        let input1 = [1, 2, 5, 3, 7, 8, 6, 4]
        let input2 = input1.map { $0-1 }
        XCTAssertEqual(countBribes(q: input2, range: 3..<7), 2)
    }
    
    func testDigitSum() throws {
        let input1 = "9875"
        let answer = "29"
        
        XCTAssertEqual(digitSum(input1), answer)
    }
    
    func testSuperDigit() throws {
        let input1 = "9875"
        let input2 = 4
        let answer = 8
        
        XCTAssertEqual(superDigit(n: input1, k: input2), answer)
    }
    
    func testEditor() throws {
        var editor = Editor()
        editor.append("abc")
        editor.printChar(3)
        editor.delete(3)
        editor.append("xy")
        editor.append("zw")
        editor.undo()
        editor.printChar(2)
        
        
    }
    func testLongestSubstring() throws {
        let input1 = "pwwkew"
        let answer = 3
        
        XCTAssertEqual(lengthOfLongestSubstring(input1), answer)
    }
    
    func test_longestPalindrome() throws {
        let input1 = "babad"
        let answer = "bab"
                
        XCTAssertEqual(longestPalindrome(input1), answer)
    }
    
    func test_longestPalindrome_2() throws {
        let input1 = "aaaa"
        let answer = "aaaa"
        
        XCTAssertEqual(longestPalindrome(input1), answer)
    }
    
    func test_longestPalindrome_3() throws {
        let input1 = "bacabab"
        
        let answer = "bacab"
        
        XCTAssertEqual(longestPalindrome(input1), answer)
    }
    
    func test_Parsefile() {
        let file = parseFile(index: 2, "F-15")
        print(file)
    }
    
    func test_filesort_1() throws {
        let input1 =  ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]

        let answer = ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]
        
        XCTAssertEqual(fileSort(input1), answer)
    }
    
    func test_filesort_2() throws {
        let input1 =  ["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]

        let answer =  ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]
        
        XCTAssertEqual(fileSort(input1), answer)
    }
    
    func test_parseRecord_1() throws {
        let input1 = "06:00 0000 IN"
        print(parseRecord(input1))
    }
    
    func test_parkingFee_1() throws {
        let input1 = ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]
        let input2 = [180, 5000, 10, 600]
        let answer = [14600, 34400, 5000]
        
        XCTAssertEqual(parking_fee(input2, input1), answer)
    }
    
    func test_parkingFee_2() throws {
        let input1 = ["00:00 1234 IN"]
        let input2 = [1, 461, 1, 10]
        let answer = [14841]
        
        XCTAssertEqual(parking_fee(input2, input1), answer)
    }
    
    func test_parkingFee_3() throws {
        let input1 = ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]
        let input2 = [120, 0, 60, 591]
        let answer = [0, 591]
        
        XCTAssertEqual(parking_fee(input2, input1), answer)
    }
    
    func test_increasingTriplet_1() throws {
        let input1 = [6,7,1,2]
        let answer = false
        
        XCTAssertEqual(increasingTriplet(input1), answer)
    }
    
    func test_increasingTriplet_2() throws {
        let input1 = [1,2,1,3]
        let answer = true
        
        XCTAssertEqual(increasingTriplet(input1), answer)
    }
    
    func test_countQuadruplets_dfs() throws {
        let input1 = [1,1,1,3,5]
        let answer = 3
        
        XCTAssertEqual(countQuadruplets(input1), answer)
    }
    
}
