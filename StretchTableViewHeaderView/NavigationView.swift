//
//  NavigationView.swift
//  StretchTableViewHeaderView
//
//  Created by lichao_liu on 2017/12/13.
//  Copyright © 2017年 com.pa.com. All rights reserved.
//

import UIKit

class NavigationView: UIView {
    var label:UILabel!
    var backBtn:UIButton = UIButton(type: .system)
    var backBlock:(()->Void)!
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: CGRect.init(x: 0, y: 0, width: 200, height: 20))
        addSubview(label)
        label.center = self.center
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.white
        
        backBtn.addTarget(self, action: #selector(whenBackBtnClicked), for: .touchUpInside)
        backBtn.setTitle("back", for: .normal)
        backBtn.frame = CGRect(x: 12, y: 12, width: 40, height: 30)
        addSubview(backBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func whenBackBtnClicked() {
        backBlock()
    }
}
