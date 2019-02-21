//
//  QuestionViewController.swift
//  MessageCut
//
//  Created by 刘勇 on 2019/2/21.
//  Copyright © 2019 com.feng. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UITextView(frame:CGRect(x: 20, y: 120, width: SCREEN_WIDTH - 40, height: SCREEN_HEIGHT - 120))
        textView.backgroundColor = UIColor.white
        
        let text = setText(qText: "发生了误判怎么办？\n\n", aText: "当正确短信被划归为垃圾短信后，这个号码之后所有的短信都会被标记为垃圾短信。从标记中放出的方法有三种，分别是：\n1、回复短信或彩信3次\n2、该号码添加到通讯录\n3、删除来自该号码的全部短信\n\n\n")
        text.append(setText(qText: "为何屏蔽后还是显示红色的未读角标？\n\n", aText: "iOS目前的系统设计是这样的哦，还无法干预。但是垃圾短信不会进行推送\n\n\n"))
        text.append(setText(qText: "剪信会上传我的短信么？\n\n", aText: "不会。剪信不会申请网络权限，整个APP不需要任何的网络请求，分类方法存在本地，会通过定时的软件更新更新模型和规则，您可以完全放心哦\n\n\n"))

        
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
        qattributeText.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)], range:NSMakeRange(0, qtext.count))
        
        return qattributeText;
    
    }
    
    
}
