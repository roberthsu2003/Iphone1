# 使用Stack _Views設計UI

## 使用StackView建立一列
## 使用StackView建立一欄

![](./images/pic2.png)

## 使用constraints和stackView建立範例頁

![](./images/pic1.png)

## 使用IBOutlet屬性介面,IBAction行為介面

```swift
import UIKit

class ViewController: UIViewController {
    @IBOutlet var titleLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func leffButtonPress(_ sender:UIButton){
        titleLabel.text = "press Left Button"
    }
    
    @IBAction func rightButtonPress(_ sender:UIButton){
        titleLabel.text = "press Right Button"
    }


}
```
