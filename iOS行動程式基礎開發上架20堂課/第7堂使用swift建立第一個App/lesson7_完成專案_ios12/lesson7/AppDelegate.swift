//
//  AppDelegate.swift
//  lesson7
//
//  Created by Robert on 2019/2/3.
//  Copyright © 2019 Robert. All rights reserved.
//

import UIKit

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = self.window ?? UIWindow();
        
        self.window!.rootViewController = ViewController();
        
        self.window!.backgroundColor = UIColor.brown;
        self.window!.makeKeyAndVisible();
        return true
    }

    

}

