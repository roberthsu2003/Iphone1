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
	- 
## ios14後,使用Cell Configuration Architecture
