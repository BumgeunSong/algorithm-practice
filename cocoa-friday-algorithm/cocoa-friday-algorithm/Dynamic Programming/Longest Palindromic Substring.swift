//
//  Longest Palindromic Substring.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/05.
//

import Foundation

func longestPalindrome2(_ s: String) -> String {
//    let arr = Array(s)
//    let strlen = arr.count
//    var isPalindrome = Array(repeating: Array(repeating: true, count: strlen),
//                             count: strlen)
//
    
    let s = Array(s)
    let n = s.count
    var isPalindrome = Array(repeating: Array(repeating: true, count: n), count: n)
    
    
    var minBegin = 0
    var maxLen = 0
    
    for len in 1...n {
        for begin in 0...n-len {
            print(s[begin..<begin+len])
            if len == 1 {
                isPalindrome[begin][begin+len-1] = true
            } else if s[begin] == s[begin+len-1] && isPalindrome[begin][begin+len-1] {
                isPalindrome[begin][begin+len-1] = true
            } else {
                isPalindrome[begin][begin+len-1] = false
                continue
            }
            if len > maxLen {
                minBegin = begin
                maxLen = len
            }
        }
    }
    return s[minBegin..<minBegin+maxLen].map { "\($0)" }.joined(separator: "")
    }
    
//    }
//
//    var minStart = 0
//    var maxEnd = 0
//
//    var start = 0
//    var len = 0
//    while len <= strlen {
//        if len == 0 {
//            isPalindrome[start][start+len] = true
//        } else if arr[start] == arr[start+len] && isPalindrome[start+1][start+len-1] {
//            isPalindrome[start][start+len] = true
//            if len > (maxEnd - minStart) {
//                minStart = start
//                maxEnd = start+len
//            }
//        } else {
//            isPalindrome[start][start+len] = false
//        }
//
//        if start < strlen-1 {
//            start += 1
//        } else {
//            len += 1
//            start = 0
//        }
//
//    }
//    
//    for start in 0..<len {
//        for end in 0..<len where start <= end {
//            
//            if arr[start] == arr[end] && isPalindrome[start+1][end-1] {
//                isPalindrome[start][end] = true
//                if (end - start) > (maxEnd - minStart) {
//                    minStart = start
//                    maxEnd = end
//                }
//            } else {
//                isPalindrome[start][end] = false
//            }
//        }
//    }
//    
//
//
//    return ""


