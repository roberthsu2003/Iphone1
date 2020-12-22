//
//  SceneDelegate.swift
//  lesson7-ios14
//
//  Created by 徐國堂 on 2020/12/22.
//

import UIKit

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

