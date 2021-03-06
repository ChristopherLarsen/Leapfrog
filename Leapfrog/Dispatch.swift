//
//  Dispatch.swift
//  Screwdriver
//  Created by Christopher Larsen on 2014-11-19.
//

import Foundation
import UIKit

/*
Usage

vay delay :Double = 1000
let block :() -> Void = { [weak self] in
    if let strongSelf = self {
    strongSelf.someMethod()
    }
}
Dispatch.after(delay, closure: block)

or 

Dispatch.after(delay, closure: { [weak self] in
if let strongSelf = self {
strongSelf.nextVibration()
}
})

*/

public typealias DispatchBlock = ()->Void

public final class Dispatch
{
    public final class func after(delay:Double, closure:()->Void) {
        
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
        
    }
    
    public final class func async(priority: Int = DISPATCH_QUEUE_PRIORITY_DEFAULT, closure:()->()) {
        
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            NSOperationQueue.mainQueue().addOperationWithBlock {
                closure()
            }
        }
        
    }
    
    public final class func toMainThread(closure:()->()) {
        
        dispatch_async(dispatch_get_main_queue()) {
            NSOperationQueue.mainQueue().addOperationWithBlock {
                closure()
            }
        }
        
    }
    
}

public var GlobalMainQueue: dispatch_queue_t {
    return dispatch_get_main_queue()
}

public var GlobalUserInteractiveQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INTERACTIVE.rawValue), 0)
}

public var GlobalUserInitiatedQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)
}

public var GlobalUtilityQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_UTILITY.rawValue), 0)
}

public var GlobalBackgroundQueue: dispatch_queue_t {
    return dispatch_get_global_queue(Int(QOS_CLASS_BACKGROUND.rawValue), 0)
}
