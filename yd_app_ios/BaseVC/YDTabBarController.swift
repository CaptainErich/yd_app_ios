//
//  YDTabBarController.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/5.
//

import Foundation
import UIKit

class YDTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        let homeVc = YDHomeViewController()
        addChildViewController(homeVc, title: "首页", image: UIImage(named: "tab_home"), selectedImage: UIImage(named: "tab_home_S"))
        
        
        
    }
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        addChild(YDNavigationController(rootViewController: childController))
    }
}

extension YDTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
