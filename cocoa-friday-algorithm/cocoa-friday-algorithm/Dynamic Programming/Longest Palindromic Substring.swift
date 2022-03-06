//
//  Longest Palindromic Substring.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/05.
//

import Foundation

func longestPalindrome2(_ s: String) -> String {
   if s.count == 0 { return "" }
   
   let s = s.map { String($0) }
   let n = s.count
   var isPalindrome = Array(repeating: Array(repeating: false, count: n), count: n)
   
   var begin = 0
   var end = 0
   var longest = (begin: 0, end: 0)
   
   for i in 0..<n {
       for j in i..<n {
           begin = j-i
           end = j
           
           if i == 0 {
               isPalindrome[begin][end] = true
               continue
           }
           
           if (s[begin] == s[end]) && (isPalindrome[begin+1][end-1] || begin == end-1) {
               isPalindrome[begin][end] = true
               longest = (begin, end)
           }
           
       }
   }
   return s[longest.begin...longest.end].joined(separator: "")
}


