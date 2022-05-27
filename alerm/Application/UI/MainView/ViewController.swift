//
//  ViewController.swift
//  alerm
//
//  Created by shin.sekaryo on 2022/05/24.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var label: UILabel!
    
    @IBOutlet private var picker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func setupNotification(dateComponents: DateComponents, body: String) {
        let content: UNMutableNotificationContent = {
            let c = UNMutableNotificationContent()
            c.body = body
            return c
        }()

        let uuidString = UUID().uuidString

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
           if let error = error {
               ApplicationLogger.error(error: error)
               return
           }
            ApplicationLogger.info(message: "notificationCenter.add success")
        }
    }

    @IBAction private func onTapSettingButton(_ sender: UIButton) {
        let date = picker.date
        let formatter: DateFormatter = {
            let f = DateFormatter()
            f.dateFormat = "yyyy-MM-dd HH:mm"
            f.calendar = Calendar(identifier: .gregorian)
            f.locale = Locale(identifier: "en_US_POSIX")
            return f
        }()
        let strDate = formatter.string(from: date)
        label.text = strDate

        let calendar = Calendar.current
        for i in (1...80) {
            let newDate = calendar.date(byAdding: .second, value: i, to: date)!
            let components = Calendar.current.dateComponents([.calendar, .year, .month, .day, .hour, .minute], from: newDate)
            setupNotification(dateComponents: components, body: "\(i)")
        }
    }
}

