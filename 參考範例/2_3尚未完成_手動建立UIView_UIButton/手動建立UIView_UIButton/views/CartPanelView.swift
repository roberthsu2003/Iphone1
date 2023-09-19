//
//  CartPanelView.swift
//  手動建立UIView_UIButton
//
//  Created by 徐國堂 on 2023/9/16.
//

import UIKit

class CartPanelView:UIView{
    init(){
        super.init(frame: CGRect.zero)
        backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
