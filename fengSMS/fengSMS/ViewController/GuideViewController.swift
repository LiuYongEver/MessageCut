//
//  GuideViewController.swift
//  MessageCut
//
//  Created by 刘勇 on 2019/2/21.
//  Copyright © 2019 com.feng. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame:self.view.frame)
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage.init(named: "help");
        imageView.contentMode = .scaleAspectFit;
        
        self.view.addSubview(imageView)
        
        
        let backButton = UIButton(frame: CGRect(x: SCREEN_WIDTH - 170, y: SCREEN_HEIGHT - 120, width: 150, height: 40));
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.setTitle("我知道了", for: .normal)
        backButton.backgroundColor = redColor;
        backButton.layer.cornerRadius = 4
        self.view.addSubview(backButton)
        

        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.back()
    }
    
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
