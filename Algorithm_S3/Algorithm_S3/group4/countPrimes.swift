//
//  countPrimes.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/07/29.
//

import Foundation

func countPrimes(_ n: Int) -> Int {
    if n <= 1 { return 0 }
    
    var isPrime = Array(repeating: true, count: n)
    isPrime[0] = false
    isPrime[1] = false
    
    var prime = 2
    while prime <= Int(sqrt(Double(n))) {
        crossOff(isPrime: &isPrime, prime: prime)
        prime = getNextPrime(isPrime: &isPrime, prime: prime)
    }
    
    return isPrime.filter { $0 == true }.count
}

func crossOff(isPrime: inout [Bool], prime: Int) {
    for i in stride(from: prime * prime, to: isPrime.count, by: prime) {
        isPrime[i] = false
    }
}

func getNextPrime(isPrime: inout [Bool], prime: Int) -> Int {
    var next = prime + 1
    while next < isPrime.count, !isPrime[next] {
        next += 1
    }
    return next
}
