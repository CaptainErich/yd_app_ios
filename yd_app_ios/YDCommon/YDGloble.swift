//
//  Globle.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/11.
//

import Foundation
import SnapKit
let UScreenWidth = UIScreen.main.bounds.width
let UScreenHeight = UIScreen.main.bounds.height

extension ConstraintView {
    var yd_snap: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        }else{
            return self.snp
        }
    }
}

var topVC: UIViewController? {
    var resultVC: UIViewController?
    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

private  func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}
