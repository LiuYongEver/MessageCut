//
//  ViewController.swift
//  fengSMS
//
//  Copyright © 2018 com.feng. All rights reserved.
//

import UIKit


enum MainTableSection:Int{
    case MainTableSectionFilter = 0 ,MainTableSectionAbout,MainTableSectionShare,MainTableSectionCount
}
//剪信是一款机器学习过滤短信的应用，现在刚刚出生，样本不多，请大家期待后续版本更新OwO
//打开 【设置 -> 信息 -> 未知与过滤短信】 在【短信过滤】标签下选择【剪信】
class MainViewController: UIViewController {

    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var filterView: UIView!
    lazy var tableView:UITableView = {
        let tableview = UITableView()
        tableview.dataSource = self;
        tableview.delegate = self;
        tableview.register(MessageFilterTableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.isScrollEnabled = false;
        
        return tableview;
    }()
    
    var cellHeight:CGFloat!
    var dataSource = ["常见问题","过滤规则","隐私政策"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    
    func setUI() {
        self.filterView.layer.shadowOpacity = 0.6;
        filterView.layer.shadowColor = UIColor.gray.cgColor
        filterView.layer.borderWidth  = 1
        filterView.layer.shadowOffset = CGSize(width: 0, height: 4)
        filterView.layer.borderColor = UIColor.white.cgColor
        filterView.layer.shadowRadius = 4;
        
        aboutView.layer.cornerRadius = 10;
        self.aboutView.layer.shadowOpacity = 0.6;
        aboutView.layer.shadowColor = UIColor.gray.cgColor
        aboutView.layer.borderWidth  = 1
        aboutView.layer.shadowOffset = CGSize(width: 0, height: 4)
        aboutView.layer.borderColor = UIColor.white.cgColor
        aboutView.layer.shadowRadius = 4;
        tableView.frame = CGRect(x: 10, y: 0, width: aboutView.frame.size.width - 20, height: aboutView.frame.size.height)
        aboutView.addSubview(self.tableView)
        self.cellHeight = (aboutView.frame.size.height)
        self.cellHeight = cellHeight/CGFloat(self.dataSource.count+1)
        
    }


}

extension MainViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewH:UIView = {
            let v = UIView(frame:  CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: cellHeight))
            v.backgroundColor = UIColor.white
            let label = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 13))
            label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            label.textColor = UIColor.lightGray
            label.center.y = v.center.y
            label.text = "关于剪信"
            
            let line = UIView.init(frame:CGRect(x: 20, y: v.frame.height
                 - 1, width: self.tableView.frame.width, height: 1))
            line.backgroundColor = lineColor
            v.addSubview(line)
            v.addSubview(label)
            return v;
        }()
        return viewH
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MessageFilterTableViewCell
        cell.titleLabel.text = dataSource[indexPath.row]
        return cell
    }
    
    
    
    
    
}
