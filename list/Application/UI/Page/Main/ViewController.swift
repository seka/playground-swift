//
//  SwiftUIListViewController.swift
//  List
//
//  Created by shin.sekaryo on 2022/06/08.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var baseView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSwiftUIView()
    }
    
    private func setupSwiftUIView() {
        let view = ListView()
        let host = addSubSwiftUIView(view, to: baseView)
        host.view.backgroundColor = .clear
    }
}
