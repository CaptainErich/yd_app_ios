//
//  YDBaseViewController.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/5.
//

import Foundation
import UIKit
import SnapKit

class YDBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension YDBaseViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
