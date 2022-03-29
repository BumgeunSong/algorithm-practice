//
//  KakaoAlgorithmTests.swift
//  algorithmTests
//
//  Created by Bumgeun Song on 2022/03/29.
//

import XCTest

class KakaoAlgorithmTests: XCTestCase {
    func testWinnder() throws {
        var n = 5
        var infor = [2,1,1,1,0,0,0,0,0,0,0]
//        XCTAssertEqual(Kakao.winner(n, infor), [0,2,2,0,1,0,0,0,0,0,0])
//        
//        n = 1
//        infor = [1,0,0,0,0,0,0,0,0,0,0]
//        XCTAssertEqual(Kakao.winner(n, infor), [-1])
//        
//        n = 9
//        infor = [0,0,1,2,0,1,1,1,1,1,1]
//        XCTAssertEqual(Kakao.winner(n, infor), [1,1,2,0,1,2,2,0,0,0,0])
//        
        n = 10
        infor = [0,0,0,0,0,0,0,0,3,4,3]
        XCTAssertEqual(Kakao.winner(n, infor), [1,1,1,1,1,1,1,1,0,0,2])
    }

}
