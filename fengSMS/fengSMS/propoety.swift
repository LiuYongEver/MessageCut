//
//  propoety.swift
//  MessageCut
//
//  Created by 刘勇 on 2019/2/21.
//  Copyright © 2019 com.feng. All rights reserved.
//

import Foundation
import UIKit

let mainColor = UIColor.init(red: 102/255, green: 186/255, blue: 183/255, alpha: 1);
let lineColor = UIColor.init(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
let redColor = UIColor.init(red: 229/255, green: 77/255, blue: 109/255, alpha: 1)

let SCREEN_HEIGHT = UIScreen.main.bounds.height
let SCREEN_WIDTH = UIScreen.main.bounds.width

extension UIView {
    
    func addOnClickListener(target: AnyObject, action: Selector) {
        let gr = UITapGestureRecognizer(target: target, action: action)
        gr.numberOfTapsRequired = 1
        self.isUserInteractionEnabled = true
        addGestureRecognizer(gr)
    }
    
}
