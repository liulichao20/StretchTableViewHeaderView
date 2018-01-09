//
//  ViewController.swift
//  StretchTableViewHeaderView
//
//  Created by lichao_liu on 2017/12/12.
//  Copyright © 2017年 com.pa.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var tableView:UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = indexPath.row == 0 ? "strechHeaderView1" : "stretchHeaderView2"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            navigationController?.pushViewController(StretchController(), animated: true)
        }else {
            navigationController?.pushViewController(StretchController2(), animated: true)
        }
    }
}

extension UIColor {
    /**
     创建颜色
     - parameter R: 红
     - parameter G: 绿
     - parameter B: 蓝
     - parameter A: 透明度
     */
    
    convenience init(R: Int, G: Int, B: Int, A: Float = 1.0) {
        self.init(red:   CGFloat(Float(R) / 255.0),
                  green: CGFloat(Float(G) / 255.0),
                  blue:  CGFloat(Float(B) / 255.0),
                  alpha: CGFloat(A))
    }
    
    convenience init(withRGBValue rgbValue: Int, alpha: Float = 1.0) {
        let r = ((rgbValue & 0xFF0000) >> 16)
        let g = ((rgbValue & 0x00FF00) >> 8)
        let b =  (rgbValue & 0x0000FF)
        self.init(R: r,
                  G: g,
                  B: b,
                  A: alpha)
    }
}
