//
//  SettingTableViewCell.swift
//  MyFirstGPUImage
//
//  Created by LiuYong on 2018/9/10.
//  Copyright © 2018年 LiuYong. All rights reserved.
//

import UIKit
class MessageFilterTableViewCell: UITableViewCell {
    
    
    var titleLabel:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
        self.titleLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 13))
        self.titleLabel.center.y = self.center.y;
        self.titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        self.contentView.addSubview(self.titleLabel)
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
