//
//  deleteDuplicates.swift
//  cocoa-friday-algorithm
//
//  Created by Bumgeun Song on 2022/01/01.
//

import Foundation

func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
    let answer = ListNode(-1, head)
    var prev: ListNode? = answer
    var current = head
    
    // current를 while 문 안에서 계속 한 단계 뒤로 넘긴다.
    // current가 nil이면 답을 return.
    while current != nil {
        // current와 current.next가 중복 아닌 값이 나올 때까지 current를 뒤로 넘긴다.
        if current?.next != nil && current!.val == current!.next!.val {
            while current?.next != nil && current!.val == current!.next!.val {
                current = current?.next
            }
            // while문이 끝나면 current가 중복값의 마지막을 가리키는 상황.
            // current.next를 prev에 붙여서 모든 중복값을 삭제한다.
            prev?.next = current?.next
        } else {
            // 만약 중복이 없으면, prev, current를 하나씩 앞으로 옮겨준다.
            prev = prev?.next
        }
        current = current?.next
        // 만약 current.next가 nil이면, current가 nil로 옮겨지면서 while문 종료
    }
    
    
    return answer.next
}
