//
//  Longest Palindromic Substring  .swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/31.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
    if s.count <= 1 { return s }
    
    let arr = s.map { "\($0)" }
    var maxLength: (i:Int, j: Int) = (0,0)
    var table = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    
    
    
    
    
    for length in 0..<s.count {
        for i in 0..<s.count where i+length < s.count {
            let j = i+length
            // length가 0인 경우는 무조건 대칭
            if length == 0 {
                table[i][j] = true
            }
            
            // length가 1인 경우는 맨 앞, 맨 뒤 체크
            if length == 1 && arr[i] == arr[j] {
                table[i][j] = true
                maxLength = (i,j)
            }
            
            // length가 2 이상인 경우는 맨 앞, 맨 뒤 체크 + 안쪽 string의 대칭 체크
            if length >= 2 && arr[i] == arr[j] && table[i+1][j-1] {
                table[i][j] = true
                maxLength = (i,j)
            }
        }
    }
    
    return arr[maxLength.i...maxLength.j].joined(separator: "")
}

