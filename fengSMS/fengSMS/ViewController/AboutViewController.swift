
//
//  AboutViewController.swift
//  MessageCut
//
//  Created by 刘勇 on 2019/2/21.
//  Copyright © 2019 com.feng. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textView = UITextView(frame:CGRect(x: 20, y: 120, width: SCREEN_WIDTH - 40, height: SCREEN_HEIGHT - 120))
        textView.backgroundColor = UIColor.white
        
        let text = setText(qText: "剪信是什么？\n\n", aText: "剪信是我一个人设计开发的短信分类应用，也是在繁忙的工作期间抽出时间做的小玩意，希望用到的朋友能够喜欢。剪信的工作原理是通过CreateML训练得到的机器学习模型将广告和正常短信进行分类。剪信现在还很稚嫩，主要是目前的样本数太少，只用到了自己搜集到的不到一千份短信样本，所以准确率并不高，也希望大家能够理解。剪信刚刚出生，也会一直更新下去，更希望有机器学习相关的朋友帮助我一起完善她！\n\n\n")
        text.append(setText(qText: "我的联系方式？\n\n", aText: "微信: wx_ever\nE-Mail:ly@liuyongvae.com\nHomePage:www.liuyongvae.com\n\n\n"))
 
        
        
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
        qattributeText.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)], range:NSMakeRange(0, qtext.count))
        qattributeText.addAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)], range:NSMakeRange(qtext.count, qtext.count+atext.count-10))

        return qattributeText;
        
    }
    
    
}
