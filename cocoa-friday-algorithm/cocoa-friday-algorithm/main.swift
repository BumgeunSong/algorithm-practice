//
//  main.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/05.
//

import Foundation

var s = "aaaaaaa"
var wordDict = ["aaaa","aaa"]
let result1 = wordBreak(s, wordDict)

s = "applepenapple"
wordDict = ["apple","pen"]
let result2 = wordBreak(s, wordDict)

s = "catsandog"
wordDict = ["cats","dog","sand","and","cat"]
let result3 = wordBreak(s, wordDict)

print(result1)
print(result2)
print(result3)
