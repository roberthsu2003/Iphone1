# 第10堂課建立以表格為基礎的App

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

6. ViewController 採納UITableViewDataSource protocol

```swift
class ViewController: UIViewController,UITableViewDataSource{
}
```

7. 實作UITableViewDataSource Protocol 內必要的2個method
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
 
 8. 告知tableView我們需要顯示的Row的數量

```swift
func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return cities.count
    }
```

9. 

- 在Cell內加入圖片
