//
//  AddString.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/12/23.
//

import Foundation

func addStrings(_ num1: String, _ num2: String) -> String {
    
    func addUp(_ num1: String, _ num2: String, _ carry: Bool, _ sum: String) -> String {
        if (0,0) == (num1.count, num2.count) {
            return carry ? "1" + sum : sum
        }
        
        let num1End = num1.count == 0 ? 0 : num1.last!.wholeNumberValue!
        let num2End = num2.count == 0 ? 0 : num2.last!.wholeNumberValue!
        let n = carry ? num1End + num2End + 1 : num1End + num2End
        
        if n / 10 > 0 {
            return addUp(String(num1.dropLast()), String(num2.dropLast()), true, "\(n % 10)" + sum)
        } else {
            return addUp(String(num1.dropLast()), String(num2.dropLast()), false, "\(n)" + sum)
        }
    }
    return addUp(num1, num2, false, "")
}
