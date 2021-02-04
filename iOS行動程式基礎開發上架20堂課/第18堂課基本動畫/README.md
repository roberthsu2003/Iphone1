# 基本動畫
1. 建立RatingViewController
2. 建立內部layout
3. 使用UIView建立簡易動畫
4. 使用unwindSegue退出modelView
5. 更新City類別屬性userRate資料

![](images/pic1.png)

![](images/pic2.png)

## 建立RatingViewController

```
//
//  RatingViewControll.swift
//  Animation
//
//  Created by Robert on 2019/2/8.
//  Copyright © 2019 gjun. All rights reserved.
//

import UIKit

class RatingViewControll: UIViewController {
    @IBOutlet var backgroundImageView:UIImageView!;
    @IBOutlet var askLabel:UILabel!;
    @IBOutlet var containerView:UIView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark);
        let blurEffectView = UIVisualEffectView(effect: blurEffect);
        blurEffectView.frame = view.bounds;
        backgroundImageView.addSubview(blurEffectView);
        askLabel.text = "您曾經來過這裏嗎?\n給這個城市一個描素吧!";
        
        containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform.identity;
        })
    }

    

}

```

City

```swift
import Foundation
class City{
    var city:String!
    var continent:String!;
    var country:String!;
    var image:String!;
    var local:String!;
    var latitude:Double!;
    var longitude:Double!;
    var url:String!;
    var userRate:String!;
    
    init(city:String, continent:String, country:String, image:String, local:String, lat latitude:Double, lon longitude:Double,url:String,userRate:String = ""){
        self.city = city;
        self.continent = continent;
        self.country = country;
        self.image = image;
        self.local = local;
        self.latitude = latitude
        self.longitude = longitude;
        self.url = url;
        self.userRate = userRate;
    }
    
    convenience init(){
        self.init(city: "", continent: "", country: "", image: "", local: "", lat: 0.0, lon: 0.0, url:"");
    }
}

```