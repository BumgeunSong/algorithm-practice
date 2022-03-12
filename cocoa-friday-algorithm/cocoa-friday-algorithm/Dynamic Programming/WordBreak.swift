//
//  WordBreak.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/03/12.
//

import Foundation

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var currentDict = wordDict
    var canBreak = [Bool]()
    
    for char in s {
        // 첫글자가 해당 글자인 단어 검색 후 첫글자 잘라냄.
        let candidate = currentDict.filter { string in
            string.first == char
        }.map { string in
            String(string.dropFirst())
        }
        
        // 만약 빈 단어가 있으면 해당 canBreak는 true.
        if candidate.contains("") {
            // 빈 단어 외에 다른 단어가 있으면, candidate에서 빈 단어 제외하고 wordDict에 추가함.
            currentDict = wordDict + candidate.filter { $0 != ""}
            canBreak.append(true)
        } else {
            // 만약 빈 단어가 없으면, false로 하고, candidate을 다음 dict로 설정함.
            currentDict = candidate
            canBreak.append(false)
        }
    }
    
    return canBreak.last ?? false
}
