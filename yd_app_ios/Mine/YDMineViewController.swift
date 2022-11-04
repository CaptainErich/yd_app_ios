//
//  YDMineViewController.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/6.
//

import Foundation
import SDCycleScrollView

class YDMineViewController: YDBaseViewController, SDCycleScrollViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        var array1 = [1,2,3,4,7,8]
        let array2 = [4,5,6]
        merge(&array1, array1.count, array2, array2.count)
        NSLog("%@", array1)
    }
    
    
    func merge(_ array1: inout [Int], _ m: Int, _ array2: [Int], _ n: Int) {
            array1 = Array(array1[..<m])
            array1 += array2
            array1.sort(by: <)
        }
    
}
