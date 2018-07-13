//
//  DictModel.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/8.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit

class DictModel: NSObject {
    var bicycleDic = [String:NSArray]()
    private static let dicmodel = DictModel()
    fileprivate override init() {
        bicycleDic =  [
            "结构系统":["车架", "坐垫", "坐杆", "坐杆夹", "后座更换"],
            "转向系统":["把套", "车把", "把立", "垫圈", "碗组", "前叉"],
            "变速系统":["指拨", "变速线管", "前变速器", "后变速器"],
            "刹车系统": ["刹把", "刹车线管", "碟刹片", "来令片"],
            "传动系统": ["脚踏", "链轮", "链条", "花鼓", "飞轮", "中轴"],
            "轮组系统":["车圈", "辐条", "辐条帽", "轮胎", "内胎"]
        ]
    }
    
    class func RWdataDic()->DictModel{
        return dicmodel
    }
    
    
}


// 结构系统:车架 坐垫 坐杆 坐杆夹 后座更换
// 转向系统：把套 车把 把立 垫圈 碗组 前叉
// 变速系统：指拨 变速线管 前变速器 后变速器
// 刹车系统: 刹把 刹车线管 碟刹片 来令片
// 传动系统: 脚踏 链轮 链条 花鼓 飞轮 中轴
// 轮组系统：车圈 辐条 辐条帽 轮胎 内胎
// https......


