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
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: CGRect.init(x: 0, y: 0, width: 200, height: 20))
        addSubview(label)
        label.center = self.center
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
