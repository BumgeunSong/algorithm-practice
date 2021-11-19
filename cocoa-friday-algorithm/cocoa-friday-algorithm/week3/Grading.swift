//
//  Grading.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2021/11/19.
//
import Foundation

func gradingStudents(grades: [Int]) -> [Int] {
    // Write your code here
    return grades.map { grade -> Int in
        if grade >= 38 && grade % 5 >= 3 {
            return grade + 5 - (grade % 5)
        }
        return grade
    }
}
