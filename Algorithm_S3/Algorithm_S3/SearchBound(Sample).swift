//
//  SearchBound(Sample).swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/22.
//

import Foundation

enum BoundType {
    case lower, upper
}

// lower Bound는 target과 '같은 수'가 처음 등장하는 인덱스
// Upper Bound는 target보다 ‘큰 수'가 처음 등장하는 인덱스

func searchBound(_ nums: [Int], _ target: Int, type: BoundType) -> Int {
    var low = 0
    var high = nums.count
    
    while low < high {
        let mid = (low + high) / 2
        
        if type == .lower ?
            target <= nums[mid] :
                target >= nums[mid]  {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}
