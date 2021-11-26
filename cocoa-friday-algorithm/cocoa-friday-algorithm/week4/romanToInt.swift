//
//  romanToInt.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/26.
//
//
import Foundation

func romanToInt(_ s: String) -> Int {
    
    let subtract = [
        "I": ["X", "V"],
        "X": ["L", "C"],
        "C": ["D", "M"]
    ]
    
    let romanToInt = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    var number = 0
    let arr = s.map { "\($0)" }
    
    var i = 0
    while i < arr.count {
        if i + 1 >= arr.count {
            number += romanToInt[arr[i]]!
            break
        }
        
        if ["I", "X", "C"].contains(arr[i])  {
            if subtract[arr[i]]!.contains(arr[i+1]) {
                number += (romanToInt[arr[i+1]]! - romanToInt[arr[i]]!)
                i += 1
            } else {
                number += romanToInt[arr[i]]!
            }
        } else {
            number += romanToInt[arr[i]]!
        }
        i += 1
    }
    return number
}
