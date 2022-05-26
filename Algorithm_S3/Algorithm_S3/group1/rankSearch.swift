//
//  rankSearch.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/06.
//

import Foundation

// 이 문제에서 중요한 점.
// 상수인 부분과 입력 N인 부분 분리하기
// 문자열 쿼리의 조합의 갯수는 정해져있다. "-"까지 포함해도 최대 100개쯤이다.
// 쿼리문의 길이도 한정되어있다. 따라서 parsing에는 반복문을 써도 된다.
// 따라서 key를 돌면서 정렬을 하거나, key를 생성하는 알고리즘은 O(n^2) 되지 않는다.
// 다만 검색을 하는 부분이 log n이어야 한다. 검색은 n만큼 도는 루프 안에 있으므로.
// 여기서 내가 어려웠던 부분은 DFS로 key 생성하는 부분.
// binarySearch로 lowerBound 구하는 부분. 중복이 있을 거라고 생각을 못했다.

func rankSearch(_ info: [String], _ query: [String]) -> [Int] {
    var dict = [String: [Int]]()
    
    for info in info {
        let (infoArr, score) = parseInfo(info)
        let keys = generateKeys(info: infoArr)
        keys.forEach { dict[$0, default: []] += [score] }
    }
    
    for key in dict.keys {
        dict[key] = dict[key]!.sorted()
    }
    
    return query.map { query in
        let (key, score) = parseQuery(query)
        guard let candidates = dict[key] else { return 0 }
        return binarySearchCount(candidates, target: score)
    }
}

func generateKeys(info: [String]) -> [String] {
    if info.isEmpty { return [""] }
    var info = info
    let fix = info.removeFirst()
    return generateKeys(info: info).map { fix + $0 }
    + generateKeys(info: info).map { "-" + $0 }
}

func parseInfo(_ info: String) -> ([String], Int) {
    var infoArr = info.components(separatedBy: " ")
    let score = Int(infoArr.removeLast())!
    return (infoArr, score)
}

func parseQuery(_ query: String) -> (String, Int) {
    var queryArr = query.components(separatedBy: " ")
    let score = Int(queryArr.removeLast())!
    let key = queryArr.filter({ $0 != "and" }).joined(separator: "")
    return (key, score)
}


func binarySearchCount(_ nums: [Int], target: Int) -> Int {
    var low = 0
    var high = nums.count
    
    while low < high {
        let mid = (low + high) / 2
        if target <= nums[mid] {
            high = mid
        } else {
            low = mid + 1
        }
    }
    // low = score 이상의 점수가 처음 등장하는 인덱스
    return nums.count - low
}
