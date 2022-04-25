//
//  OpenChat.swift
//  algorithm-season2
//
//  Created by Bumgeun Song on 2022/04/25.
//

import Foundation

func openChat(_ record: [String]) -> [String] {
    var nicknames = [String: String]()
    var logs = [(isEnter: Bool, id: String)]()
    
    func parse(_ record: String) {
        let recordArr = record.components(separatedBy: " ")
        
        let action = recordArr[0]
        let userID = recordArr[1]
        
        switch action {
        case "Enter":
            logs.append((true, userID))
            nicknames[userID] = recordArr[2]
        case "Leave":
            logs.append((false, userID))
        case "Change":
            nicknames[userID] = recordArr[2]
        default: break
        }
    }
    
    record.forEach { parse($0) }
    
    return logs.map { log -> String in
        let nickname = nicknames[log.id] ?? ""
        let message = log.isEnter ? "님이 들어왔습니다." : "님이 나갔습니다."
        return nickname + message
    }
}
