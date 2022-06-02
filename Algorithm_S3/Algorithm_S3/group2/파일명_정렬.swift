//
//  파일명_정렬.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/02.
//

import Foundation

func fileSort(_ files:[String]) -> [String] {
    let files = files.enumerated().map { (i, filename) in
        return parseFile(index: i, filename)
    }.sorted {
        if $0.head == $1.head {
            if $0.number == $1.number {
                return $0.originIndex < $0.originIndex
            } else {
                return $0.number < $1.number
            }
        } else {
            return $0.head < $1.head
        }
    }
    
    return files.map { $0.originString }
}

func parseFile(index: Int, _ fileName: String) -> File {
    let arr = Array(fileName)
    
    var firstNumberIndex = 0
    for (i, char) in fileName.enumerated() {
        if char.isWholeNumber {
            firstNumberIndex = i
            break
        }
    }
    
    var endNumberIndex = arr.count
    for i in firstNumberIndex..<arr.count {
        if !arr[i].isWholeNumber {
            endNumberIndex = i
            break
        }
    }
    
    let head = String(arr[0..<firstNumberIndex]).lowercased()
    let number = Int(String(arr[firstNumberIndex..<endNumberIndex]))!
    
    return File(head: head, number: number, originIndex: index, originString: fileName)
}

struct File {
    let head: String
    let number: Int
    let originIndex: Int
    let originString: String
}
