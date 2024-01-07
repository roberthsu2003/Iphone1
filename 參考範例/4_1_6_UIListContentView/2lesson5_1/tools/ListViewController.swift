//
//  ListViewController.swift
//  2lesson5_2
//
//  Created by 徐國堂 on 2024/1/5.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet var stackView:UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ListContentView"
        for pep in ["manny", "moe", "jack"]{
            var config = UIListContentConfiguration.cell()
            config.text = pep
            config.image = UIImage(named: pep)
            let listContentView = UIListContentView(configuration: config)
            stackView.addArrangedSubview(listContentView)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        stackView.addGestureRecognizer(tap)
        
        self.checkFavorite() //預先有勾,必需最後執行
    }
    
    var currentFavorite = "moe"{
        didSet{
            print("您選擇的是:",currentFavorite)
        }
    }
    @objc func didTap(_ gr:UIGestureRecognizer){
        //print(gr) //可以顯示相關資訊,view,state
        guard let stackView = gr.view, gr.state == .ended else {return}
        let stackViewPoint = gr.location(in: stackView) //點到stackView內的坐標
        if let listContentView = stackView.hitTest(stackViewPoint, with: nil) as? UIListContentView{
            //取出UIListContentConfiguration
            if let config = listContentView.configuration as? UIListContentConfiguration{
                if let which = config.text{
                    self.currentFavorite = which
                    checkFavorite()
                    self.dismiss(animated: true)
                }
            }
        }
    }
    func checkmarkView() -> UIImageView{
        let imageView = UIImageView(image: UIImage.init(systemName: "checkmark"))
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.tintColor = .label
        imageView.tag = 100
        return imageView
    }
    
    func checkFavorite(){
        for listContentView in stackView.arrangedSubviews as! [UIListContentView]{
            //如果有勾的圖片的,移除圖片
            if let checkImage = listContentView.viewWithTag(100){
                checkImage.removeFromSuperview()
            }
            if let config = listContentView.configuration as? UIListContentConfiguration{
                if let which = config.text, which == self.currentFavorite{
                    let checkImage = self.checkmarkView()
                    listContentView.addSubview(checkImage)
                    if let text = listContentView.textLayoutGuide{
                        checkImage.leadingAnchor.constraint(equalTo: text.trailingAnchor, constant: 20).isActive = true
                        checkImage.centerYAnchor.constraint(equalTo: text.centerYAnchor).isActive = true
                    }
                }
            }
            
        }
    }
    

}
