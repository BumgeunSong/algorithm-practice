//
//  Deallochooker.swift
//  Algorithm_S3
//
//  Created by Bumgeun Song on 2022/06/06.
//

import Foundation


final class DeallocHooker {
    private struct AssocciatedKey {
        static var deallocHookcer = "deallocHooker"
    }
    
    private let handler: () -> Void
    private init(_ handler: @escaping () -> Void) {
        self.handler = handler
    }
    
    deinit {
        handler()
    }
    
    static func install(to object: AnyObject, _ handler: @escaping () -> Void) {
        objc_setAssociatedObject(
            object,
            &AssocciatedKey.deallocHookcer,
            DeallocHooker(handler),
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
}
