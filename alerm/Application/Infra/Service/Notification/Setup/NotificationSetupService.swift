//
//  NotificationSetupService.swift
//  Alerm
//
//  Created by shin.sekaryo on 2022/05/27.
//

import UIKit

final class SetupPermissionNotificationService: BaseNotificationCenterService {
    override func addObserver() {
        center.addObserver(forName: notificationName, object: nil, queue: queue) { _ in self.setupNotificationCenter() }
    }
    
    private func setupNotificationCenter() {
        // 通知を受け取った際に表示するための許諾を取る (拒否した場合もサイレントにプッシュ通知を受け取ることはできる)
        let center = UNUserNotificationCenter.current()
        if let appDelegate = UIApplication.shared.delegate as? UNUserNotificationCenterDelegate {
            center.delegate = appDelegate
        }
        center.requestAuthorization(options: [.sound, .alert, .badge]) { _, error in
            guard let error = error else { return }
            ApplicationLogger.error(error: error)
        }
        // 通知デバイストークンの取得をリクエストする
        // https://developer.apple.com/documentation/uikit/uiapplication/1623078-registerforremotenotifications
        DispatchQueue.main.async {
            // AppDelegate+DeviceToken でハンドリングを行う
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
}
