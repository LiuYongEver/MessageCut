//
//  PrivacyViewController.swift
//  MessageCut
//
//  Created by 刘勇 on 2019/2/21.
//  Copyright © 2019 com.feng. All rights reserved.
//

import UIKit

class PrivacyViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UITextView(frame:CGRect(x: 20, y: 120, width: SCREEN_WIDTH - 40, height: SCREEN_HEIGHT - 120))
        textView.backgroundColor = UIColor.white
        
        let text = setText(qText: "隐私政策\n\n", aText: "1、剪信不会收集用户的任何信息，所有分类和识别操作完全在本地进行，不对您的隐私造成任何侵犯\n\n2、剪信不需要您的网络权限，也不会尝试任何形式的上传、窃取操作\n\n3、点击「我知道了」即代表您同意剪信的隐私政策并开始使用")
    
        
        
        textView.attributedText = text
        textView.isEditable = false;
        
        
        self.view.addSubview(textView)
        
        
        let backButton = UIButton(frame: CGRect(x: SCREEN_WIDTH - 170, y: SCREEN_HEIGHT - 120, width: 150, height: 40));
        backButton.center.x = self.view.center.x
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.setTitle("我知道了", for: .normal)
        backButton.backgroundColor = redColor;
        backButton.layer.cornerRadius = 4
        self.view.addSubview(backButton)
        self.view.backgroundColor = UIColor.white
        
        
    }
    
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setText (qText:String,aText:String) -> NSMutableAttributedString{
        
        let qtext = qText;
        let atext = aText;
        
        let qattributeText = NSMutableAttributedString.init(string:qtext+atext )
        qattributeText.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)], range:NSMakeRange(0, qtext.count))
        qattributeText.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)], range:NSMakeRange(qtext.count, qtext.count+atext.count-10))
        
        return qattributeText;
        
    }
    
    
}
