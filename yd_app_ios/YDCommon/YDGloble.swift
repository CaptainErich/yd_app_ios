//
//  Globle.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/11.
//

import Foundation
import SnapKit

extension ConstraintView {
    var yd_snap: ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        }else{
            return self.snp
        }
    }
}
