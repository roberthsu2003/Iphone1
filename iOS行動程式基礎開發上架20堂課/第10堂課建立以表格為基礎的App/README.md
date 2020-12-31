# 第10堂課建立以表格為基礎的App

![](./images/pic1.png)

## 解析citylist.plist檔內的資料

1. 將資源檔內的citylist.plist加入至專案中
2. 將資源檔內的cityImage資料夾內的圖片加入至Assets內
3. 解析citylist.plist內的資料，將資料儲存至屬性cityies內

```swift
import UIKit

class ViewController: UIViewController {
    var cities:[[String:Any]]!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //利用Bundle.main載入取出citylist.plist在Bundle檔內的絕對路徑
        let bundle = Bundle.main;
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有發現些檔案")
            return
        }
        //使用NSArray解析citylist.plist內的內容，並將轉換為List的型別
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]]
        
        //使用取出list內的Dictionary物件
        for city in cities{
            print(city)
        }        
        
    }


}
```

## 建立UITableView

1. 在storyboard內加入tableView，並建立接口cityTableView

```swift
@IBOutlet var cityTableView:UITableView!;
```

2. 設定cityTableView的dataSource為ViewController

```swift
cityTableView.dataSource = self;
```

```swift
class ViewController: UIViewController {
    @IBOutlet var cityTableView:UITableView!
    var cities:[[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //利用Bundle.main載入Bundle內的citylist.plist
        let bundle = Bundle.main;
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有發現些檔案")
            return
        }
        
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]]
        
        cityTableView.dataSource = self;
        
    }
}
```

## 建立UITableView要顯示的資料

1. ViewController 採納 UITableViewDataSource protocol

```swift
class ViewController: UIViewController,UITableViewDataSource{
}
```

2. 實作UITableViewDataSource Protocol 內必要的2個method
	- func tableView(_ tableView: UITableView, 
numberOfRowsInSection section: Int) -> Int

	- func tableView(_ tableView: UITableView, 
  cellForRowAt indexPath: IndexPath) -> UITableViewCell
  
 ```swift
 func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
    }
 ``` 
 
 
3. 告知tableView我們需要顯示的Row的數量

```swift
func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
```

## 產生UITableViewCell

1. 將storyboard內的UITableView新增一個Prototype Cell,並將cell的identifier改為CELL
2. 取出cities內的資料，並建立UITableViewCell，將資料加入至cell內

```swift
func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let rowIndex = indexPath.row
        let cityDic = cities[rowIndex]
        let cityName = cityDic["City"] as? String ?? "NoName";
        let imageName = cityDic["Image"] as? String ?? "NoImage"
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        cell.textLabel!.text = cityName
        cell.imageView!.image = UIImage(named: imageName)
        return cell
    }
```

## ViewController.swift內容

```swift
//
//  ViewController.swift
//  lesson10-ios14
//
//  Created by 徐國堂 on 2020/12/31.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var cityTableView:UITableView!
    var cities:[[String:Any]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //利用Bundle.main載入Bundle內的citylist.plist
        let bundle = Bundle.main;
        guard let pathURL = bundle.url(forResource: "citylist", withExtension: "plist") else{
            print("沒有發現些檔案")
            return
        }
        
        cities = NSArray(contentsOf: pathURL) as? [[String:Any]]
        
        cityTableView.dataSource = self;
        
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //取出目前要顯示的row索引編號
        let rowIndex = indexPath.row
        
        //取出城市資料
        let cityDic = cities[rowIndex]
        
        //取出城市名稱
        let cityName = cityDic["City"] as? String ?? "NoName";
        
        //取出圖片名稱
        let imageName = cityDic["Image"] as? String ?? "NoImage"
        
        //透過prototype建立UITableViewCell實體
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        
        //將資料加入至cell內
        cell.textLabel!.text = cityName
        cell.imageView!.image = UIImage(named: imageName)
        return cell
    }
}


```




