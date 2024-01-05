# tableView基本概念
#### 1. UITableView 繼承 UIScrollView
2. 只有垂直捲動
3. 只有一個欄位
4. UITableView包含非常多的UITableViewCell
5. 
## 主要目的
1.顯示資訊
2.選取
3.導覽

### Master-detail的最好選擇

### tableView有headerView和footerView

### tableView內的Cell可以組合成為Section,每個Section可以有header和footer,目的為說明這組是何資料

### section index 可以成為縮寫,顯示在tableView右邊,tab後可以直接跳至該section

### tableView可以被編輯,inser,delete,reorder

### cell可以有actions:使用者有左而右滑動,或由右而左滑動

### cell長按可以有menu item

### table有Group format的說明,一個section,有header和footer來說明

	-
## ios14後,使用Cell Configuration Architecture

# 有關於Cell

## Cell
- 制作一個reused的Cell
- cell是放在tableView的Row內
- cell內必需放置目前顯示在那一個row上面
## Cell的4個style
- default
	- UILable 和 optional UIImageView
	- 左邊圖片,右邊文字
- value1
	- textLabel,detailTextLable 和 imageView
- value2
	- textLabel,detailTextLable 和 imageView
- subtitle
	- textLabel,detailTextLable 和 imageView
	- 右邊文字,左邊圖片

## tableView 沒有 register的寫法

```
//取出tableViewCell的方法,會傳出UITableViewCell?
dequeueReusableCell(withIdentifier:)
```

```swift
    override func numberOfSections(in tableView: UITableView) -> Int{
        //多少個section
        return 1
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int{
        //每個section,多少個row
        return 100
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell{
        //給Row資料
        let rowIndex = indexPath.row
        if #available(iOS 15, *)
        {
            print("ios 15以執行")
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                //print(rowIndex)
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
                //cell外觀永遠不會改變的
                cell?.textLabel?.textColor = .systemRed
                let imageView = UIImageView(image: UIImage(named: "linen.png"))
                imageView.contentMode = .scaleToFill
                cell?.backgroundView = imageView
                let selectedView = UIView()
                selectedView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
                cell?.selectedBackgroundView = selectedView
            }
            //cell外觀會改變的
            var contentConfiguration = cell?.defaultContentConfiguration()
            contentConfiguration?.text = "cell-\(rowIndex)"
            contentConfiguration?.textProperties.color = .systemRed
            cell?.contentConfiguration = contentConfiguration
            return cell!
        }
        else
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                //print(rowIndex)
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
                //cell外觀永遠不會改變的
                cell?.textLabel?.textColor = .systemRed
                let imageView = UIImageView(image: UIImage(named: "linen.png"))
                imageView.contentMode = .scaleToFill
                cell?.backgroundView = imageView
                let selectedView = UIView()
                selectedView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
                cell?.selectedBackgroundView = selectedView
            }
            //cell外觀會改變的
            cell?.textLabel?.text = "cell-\(rowIndex)"
            return cell!
            
        }
    }    


```

## Cell 特徵

- accessory Type
- accessory View
- indentationLevel, indentationWidth
- separatorInset -> UIEdgetInset,只有設定左和右
- selectionStyle
- backgroundColor
- backgroundView
- selectedBackgroundView -> 它的位置在backgroundView的上方
- multipleSelectionBackgroundView

## TableView 特微

- rowHeight
	- 使用nib編輯器設定
	- 即時更改,使用tableViewDelegate tableView(_:heightForRowAt:)
- separatorStyle, separatorColor
- separatorInset, separatorInsetReference
- backgroundColor, backgroundView
- tableHeaderView, tableFooterView
- insetContentViewsToSafeArea

## tableView 註冊 register的寫法

```
//取出tableViewCell的方法,會傳出UITableViewCell
dequeueReusableCell(withIdentifier:for:)
```

#### 使用上面寫法的3各好處

- 結果不會傳出nil
- cellSize被知道,可以知道rowHeight

### 3種註冊 tableView的UITableViewCell
1. 提供class
2. 提供nib
3. 提供storyboard

### 何時註冊tableView的UITableViewCell
- talbeView要產生UITableView前,viewDidLoad是一個最好的地方

```
//註冊方式
let cellID = "Cell"
        override func viewDidLoad() {
            super.viewDidLoad()
            self.tableView.register(
                UITableViewCell.self, forCellReuseIdentifier: self.cellID)
}
```

如何設定cell的style(必需繼承UITableViewCell)
		- 自訂一個MyCell class ,繼承UITableViewCell
		- 假設使用subtitle
		- override以下的method

```
override init(style: UITableViewCell.CellStyle,
            reuseIdentifier: String?) {
                super.init(style:.subtitle, reuseIdentifier: reuseIdentifier)
}
```

### 如何知道,傳出的Cell是new cell還是 reused?
因為dequeueReusableCell(withIdentifier:for:),不會傳出nil,所以必需要有識別的方式,new cell沒有tagID, reused cell有tagID


