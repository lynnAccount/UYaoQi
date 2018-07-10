//
//  Bundle+Extension.swift
//  UYaoQi
//
//  Created by Lynn on 2018/7/10.
//  Copyright © 2018年 Lynn. All rights reserved.
//

import Foundation

extension Bundle{
    var nameSpace: String {
        // 返回命名空间
        let name = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""

        return name
    }
}
