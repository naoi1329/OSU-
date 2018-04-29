//
//  HomeTabBarController.swift
//  OSU!!
//
//  Created by 直井翔汰 on 2018/04/28.
//  Copyright © 2018年 直井翔汰. All rights reserved.
//

import Foundation
import UIKit

class HomeTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print(type(of: viewController))
        if viewController is DammyViewController {
            
            if let currentVC = self.selectedViewController {
                //表示させるモーダル
                guard let view = UIStoryboard(name: "LetterPost", bundle: nil).instantiateInitialViewController() else {
                    return false
                }
                
                view.modalTransitionStyle = .coverVertical
                
                currentVC.present(view, animated: true, completion: nil)
            }
            return false
        }
        return true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
