## 第7堂使⽤swift建立第⼀個App
- ios的啟動流程
- 取得UIWindow
- 取得ViewControlle
- 建立自訂的UIView
- CGRect

### ios的啟動流程
1. UIApplicationMain 建立UIApplication實體,未來可以使用UIApplication.shared取得實體,然後實體化 AppDelegate類別,讓AppDelegate的實體為UIApplication的代理人

2. UIApplicationMain呼叫UIApplication代理人的application(_:didFinishLaunchingWithOptions:),實作這個method, 可以取得應用程式啟動時的起點。

3. UIApplicationMain建立UISceneSession,UIWindowScene,和實體化SceneDelegate(依據info.plist->Application Scene Manifest -> Scene Configuration->Delegate class name)

4. 依據info.plist->Application Scene Manifest -> Scene Configuration->storyboard name, 實體化 main.storyboard內的View Controller

5. 如果使用storyboard, UIApplicationMain建立UIWindow實體,將它指定給SceneDelegaten內的屬性window.

6. 如果使用storyboard, UIApplicationMain建立ViewController的實體並將它指定給UIWindow實體內的rootViewController屬性,並將rootViewController內的view成為UIWindow內的子View

7. UIApplicationMain執行UIWindowd的makeKeyAndVisible()method. 讓UIWindown出現在螢幕上

8. 再來SceneDelegate類別內的scene(_:willConnectTo:options:)被執行

### 取得UIWindow,取得ViewControlle

- 在SceneDelegate類別內取得UIWindow
- 在UIWindow內取得ViewController實體


```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        /*
         //不好的寫法!可讀性不佳
        if let window = window{
            if let viewController = window.rootViewController as? ViewController{
                viewController.view.backgroundColor = .green
            }
        }
         */
        
        guard let window = window else{
            return;
        }
        
        guard let viewController = window.rootViewController as? ViewController else{
            return;
        }
        
        viewController.view.backgroundColor = .green
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }

}
```

### 建立自訂的UIView
- 在ViewController內建立UIView

```
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v = UIView(frame:CGRect(x:100, y:100, width:50, height:50))
            v.backgroundColor = .red // 紅色的矩形
            self.view.addSubview(v) // 加入到view內成為view的subView
    }
}

```


