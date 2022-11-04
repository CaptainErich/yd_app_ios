//
//  YDHomeTableViewCell.swift
//  yd_app_ios
//
//  Created by 黑旭鹏 on 2022/5/27.
//

import Foundation
import UIKit

class YDHomeTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        return titleLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initCell()
    }
    
    func initCell() {
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: HomeJobListModel? {
        didSet {
            guard let model = model else { return }
            titleLabel.text = model.title
        }
    }
    
}
