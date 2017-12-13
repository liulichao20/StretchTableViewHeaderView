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
    var stretchHeader:StretchHeaderView = StretchHeaderView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    var navView = NavigationView(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIApplication.shared.statusBarFrame.size.height + 44))
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        stretchHeader.backgroundColor = UIColor.red
        stretchHeader.stretchHeader(tableView: tableView) { (contentView) in
            let avater = UIImageView(frame: CGRect.init(x: 50, y: 50, width: 50, height: 50))
            avater.backgroundColor = UIColor.orange
            avater.center = contentView.center
            contentView.addSubview(avater)
        }
        navView.label.text = "标题"
         navView.backgroundColor = UIColor.init(R: 255, G: 255, B: 255, A: 0)
        view.addSubview(navView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        stretchHeader.scrollViewDidScroll(scrollView: scrollView)
        let distance = scrollView.contentOffset.y
        var alpha = Float(distance/(200 - 44 - UIApplication.shared.statusBarFrame.height))
        alpha = alpha < 0 ? 0 : alpha
        alpha = alpha > 1 ? 1 : alpha
        navView.backgroundColor = UIColor.init(R: 255, G: 255, B: 255, A: alpha)
        print(alpha)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        stretchHeader.resizeView()
        navView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
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
