//
//  CardPanelView.swift
//  lesson21_2
//
//  Created by 徐國堂 on 2023/11/14.
//

import UIKit

class CardPanelView: UIView {
    private lazy var stackView:UIStackView = {
        let stackView = UIStackView(frame: CGRect.zero)
        
        return stackView
    }()
    
    init(){
        super.init(frame: CGRect.zero)
        backgroundColor = .secondarySystemBackground
        addSubview(stackView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
