//
//  AppDelegate.swift
//  ImgurAPI
//
//  Created by Радим Гасанов on 15.04.2020.
//  Copyright © 2020 Радим Гасанов. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application( _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        self.window = window
        let VC = MainAssembly.createModule(serviceLocator: DefaultServiceLocator())
        window.rootViewController = VC
        window.makeKeyAndVisible()
        return true
    }
    
}

