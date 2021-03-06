//
//  StretchHeaderView.swift
//  StretchTableViewHeaderView
//
//  Created by lichao_liu on 2017/12/12.
//  Copyright © 2017年 com.pa.com. All rights reserved.
//

import UIKit

class StretchHeaderView:UIView {

    weak var tableView:UITableView?
    var initialFrame:CGRect = CGRect.zero
    var defaultViewHeight:CGFloat = 200
    var contentView:UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView = UIImageView(frame: bounds)
        contentView.backgroundColor = UIColor.clear
        contentView.contentMode = .scaleAspectFill
        contentView.clipsToBounds = true
        addSubview(contentView)
        contentView.backgroundColor = UIColor.orange
        initialFrame = frame
        defaultViewHeight = frame.size.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stretchHeader(tableView:UITableView,configContentViewBlock:(_ conentView:UIView)->Void) {
        self.tableView = tableView
        let headerView = UIView(frame: initialFrame)
        tableView.tableHeaderView = headerView
        tableView.addSubview(self)
        configContentViewBlock(contentView)
    }
    
    func scrollViewDidScroll(scrollView:UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            let offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1.0
            initialFrame.origin.y = -offsetY
            initialFrame.origin.x = -offsetY/2
           
            initialFrame.size.width = tableView!.frame.width + (offsetY > 0 ? offsetY : -offsetY)
            initialFrame.size.height = defaultViewHeight + offsetY
            
            contentView.frame = initialFrame
        }else {
            var f = frame
            f.size.width = tableView!.frame.size.width
            f.origin.x = 0
           contentView.frame = f
        }
    }
    
    func resizeView(){
        initialFrame.size.width = tableView!.frame.width
        initialFrame.origin.x = 0
        frame = initialFrame
    }
}
