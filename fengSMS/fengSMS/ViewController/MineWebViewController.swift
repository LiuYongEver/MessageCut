//
//  MineWebViewController.swift
//  MessageCut
//
//  Created by 刘勇 on 2019/2/21.
//  Copyright © 2019 com.feng. All rights reserved.
//

import UIKit
import WebKit
class MineWebViewController: UIViewController {
    
    var url:URL! = nil
    lazy var webview:WKWebView = {
        let configuration = WKWebViewConfiguration()
        let wb = WKWebView(frame: CGRect.zero, configuration: configuration)
        wb.navigationDelegate = self
        return wb
    }()
    
    
    init(weburl:URL) {
        url = weburl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = ""
        setUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //
    
    func setUI(){
        
        webview.frame = self.view.frame
        view.addSubview(webview)

        
        let request = URLRequest(url: url)
        webview.load(request)
        
        
        let backButton = UIButton(frame: CGRect(x: 20 , y: 20, width: 45, height: 45));
        backButton.center.x = self.view.center.x
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        backButton.setTitle("返回", for: .normal)
        backButton.backgroundColor = redColor;
        backButton.layer.cornerRadius = 4
        self.view.addSubview(backButton)
        self.view.backgroundColor = UIColor.white
        
        
    }
    
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


extension MineWebViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("请求")
    }
    
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("开始")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("失败")
    }
    
}
