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

    @IBAction private func onTapSettingButton(_ sender: UIButton) {
        let formatter: DateFormatter = {
            let f = DateFormatter()
            f.dateFormat = "yyyy-MM-dd HH:mm"
            f.calendar = Calendar(identifier: .gregorian)
            f.locale = Locale(identifier: "en_US_POSIX")
            return f
        }()
        let strDate = formatter.string(from: picker.date)
        label.text = strDate
    }
}

