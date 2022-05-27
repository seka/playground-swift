//
//  NotificationCenterService.swift
//  Alerm
//
//  Created by shin.sekaryo on 2022/05/27.
//

import Foundation

protocol NotificationCenterService {
    var notificationName: Notification.Name { get }
    var queue: OperationQueue { get }
    func call()
    func addObserver()
    func removeObserver()
}

class BaseNotificationCenterService: NSObject, NotificationCenterService {
    var notificationName: Notification.Name {
        let name = String(describing: type(of: self))
        return NSNotification.Name(rawValue: name)
    }
    
    var queue: OperationQueue {
        OperationQueue.main
    }
    
    var center: NotificationCenter = .default

    func call() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(name: notificationName, object: nil)
    }
    
    func addObserver() {
        fatalError("addObserver() should be implemented.")
    }
    
    func removeObserver() {
        fatalError("removeObserver() should be implemented.")
    }
}
