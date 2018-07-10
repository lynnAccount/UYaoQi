//
//  BaseTabbarController.swift
//  UYaoQi
//
//  Created by Lynn on 2018/7/10.
//  Copyright © 2018年 Lynn. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        controllers()
        
        // 取消默认tabbar背景颜色
        tabBar.isTranslucent = false
        
    }
    
    private func controllers(){
        
        let arr = [
            ["clsName" : "HomeViewController", "title" : "首页", "highImg" : "tab_home_S", "normalImg":"tab_home"],
            ["clsName" : "ClassifyViewController", "title" : "分类", "highImg" : "tab_class_S", "normalImg":"tab_class"],
            ["clsName" : "BookshelfViewController", "title" : "书架", "highImg" : "tab_book_S", "normalImg":"tab_book"],
            ["clsName" : "MineViewController", "title" : "我的", "highImg" : "tab_mine_S", "normalImg":"tab_mine"]
        ]
        
        var arrV = [BaseNavigationController]()
        
        for dict in arr {
            arrV.append(setController(dict: dict))
        }
    
        viewControllers = arrV
    }

    private func setController(dict: [String: String]) -> BaseNavigationController{
    
        // 根据类名生成对应controller
        guard let clsName = dict["clsName"],
              let _ = dict["title"],
              let highImg = dict["highImg"],
              let normalImg = dict["normalImg"],
              let vcName = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? BaseViewController.Type
            else {

            return BaseNavigationController()
        }
        
        let vc = vcName.init()
        
        vc.tabBarItem = UITabBarItem(title: "", image: UIImage(named: normalImg)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: highImg)?.withRenderingMode(.alwaysOriginal))
        vc.tabBarItem.imageInsets = .init(top: 6, left: 0, bottom: -6, right: 6)
        
        let nav = BaseNavigationController(rootViewController: vc)
        
        return nav
    }
}
