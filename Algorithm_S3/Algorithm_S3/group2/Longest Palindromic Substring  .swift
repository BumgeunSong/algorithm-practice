//
//  Longest Palindromic Substring  .swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/31.
//

import Foundation

func longestPalindrome(_ s: String) -> String {
    let arr = Array(s)
    if isPalindrome(ArraySlice(arr)) { return s }
    
    var start = 0
    var end = 1
    var longest = [arr[0]]
    
    while end < s.count {
        if isPalindrome(arr[start...end]) {
            longest = Array(arr[start...end])
            end += 1
            start = 0
        } else {
            if (end + 1 - start) > longest.count+1 {
                start += 1
            } else {
                end += 1
            }
        }
    }
    return String(longest)
}

func isPalindrome(_ s: ArraySlice<Character>) -> Bool {
    if s.count <= 1 { return true }
    return s.first == s.last && isPalindrome(s.dropFirst().dropLast())
}
