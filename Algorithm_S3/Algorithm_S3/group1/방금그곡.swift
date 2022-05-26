//
//  방금그곡.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/05/22.
//

import Foundation


func 방금그곡(_ m: String, _ musicinfos: [String]) -> String {
    let musicInfos = musicinfos.map { MusicInfo($0) }.sorted {
        if $0.playtime == $1.playtime { return $0.playStart < $1.playStart }
        return $0.playtime > $1.playtime
    }
    let melody = parseNote(m)
    
    for musicInfo in musicInfos {
        if include(melody, musicInfo.notes) {
            return musicInfo.title
        }
    }
    return "(None)"
}

struct MusicInfo {
    let playtime: Int
    let playStart: Int
    let title: String
    let notes: [String]

    init(_ string: String) {
        let arr = string.components(separatedBy: ",")
        let time = getTimeInterval(start: arr[0], end: arr[1])
        self.playtime = time
        self.playStart = convertToSec(arr[0])
        self.title = arr[2]
        self.notes = getPlayedNote(parseNote(arr[3]), time)
    }
}

func getTimeInterval(start: String, end: String) -> Int {
    return convertToSec(end) - convertToSec(start)
}

func convertToSec(_ string: String) -> Int {
    let strArr = string.components(separatedBy: ":").map { Int($0)!}
    return strArr[0] * 60 + strArr[1]
}

func getPlayedNote(_ note: [String], _ playTime: Int) -> [String] {
    return (0..<playTime/note.count).reduce([String]()) { partialResult, _ in
        partialResult + note
    } + note[0..<playTime % note.count]
}

func parseNote(_ note: String) -> [String] {
    var result = [String]()
    let noteArr = note.map { String($0) }
    
    for i in 0..<noteArr.count {
        if noteArr[i] == "#" {
            result[result.count-1] += "#"
        } else {
            result.append(noteArr[i])
        }
    }
    return result
}

func include(_ melody: [String], _ original: [String]) -> Bool {
    if melody.count > original.count { return false }
    if melody.count == original.count { return melody == original }
    
    for i in 0..<original.count-melody.count+1 {
        if melody[0..<melody.count] == original[i..<i+melody.count] {
            return true
        }
    }
    return false
}
