//
//  SceneDelegate.swift
//  lesson7
//
//  Created by 徐國堂 on 2020/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //UIWindow的實體會被指定給window屬性
        guard let _ = (scene as? UIWindowScene) else { return }
        print("window已經顯示!")
        //window!.rootViewController!.view.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        /*
        if let window = window{
            if let viewController = window.rootViewController{
                viewController.view.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
            }else{
                print("rootViewController是nil")
            }
        }else{
            print("window是nil")
        }
         */
        //提早離開
        guard let window = window else{
            print("window是nil")
            return
        }
        
        guard let viewController = window.rootViewController else{
            print("rootViewController是nil")
            return
        }
        
        viewController.view.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 1)
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

