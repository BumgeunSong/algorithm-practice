//
//  MergeTwoSortedLists.swift
//  Algorithm_S4
//
//  Created by Bumgeun Song on 2022/07/30.
//

import Foundation

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    
    switch (list1, list2) {
    case (nil, nil):
        return nil
    case (nil, _):
        return list2
    case (_, nil):
        return list1
    case (_, _):
        if list1!.val < list2!.val {
            let merged = mergeTwoLists(list1?.next, list2)
            list1?.next = merged
            return list1
        } else {
            let merged = mergeTwoLists(list1, list2?.next)
            list2?.next = merged
            return list2
        }
    }
}
