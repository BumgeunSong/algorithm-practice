//
//  ProtocolType.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/24.
//

import Foundation

protocol MyCollection {
    var value: [Int] { get set }
}

struct MyArrayStruct: MyCollection {
    var value: [Int]
    
    init(_ value: [Int]) {
        self.value = value
    }
}

class MyArrayClass: MyCollection {
    var value: [Int]
    
    init(_ value: [Int]) {
        self.value = value
    }
}

func testProtocolType()  {
    let myCollection: MyCollection = MyArrayStruct([1,2,3])
    var myCollectionB = myCollection
    
    myCollectionB.value[0] = 4
    
    print(myCollection.value) // [1, 2, 3]
    print(myCollectionB.value) // [4, 2, 3]
    
}

func testProtocolType2() {
    let myCollection: MyCollection = MyArrayClass([1,2,3])
    var myCollectionB = myCollection
    
    myCollectionB.value[0] = 4
    
    print(myCollection.value) // [4, 2, 3]
    print(myCollectionB.value) // [4, 2, 3]
}
