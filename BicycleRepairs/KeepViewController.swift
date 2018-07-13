//
//  KeepViewController.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/24.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit
// 保养界面
class KeepViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
       
        let title = "周杰伦"
        let imagee = #imageLiteral(resourceName: "骑友圈45x45")
        addCoreData(title: title, image: imagee) // 增
        printAllDataWithCoreData()
        
        let array = selectDataFromCoreData()
        let item = array[0] as! Fixser
        let image = UIImage(data: item.imageA as! Data)
        let imageview = UIImageView(frame: CGRect(x: 100, y: 200, width: 40, height: 40))
        imageview.image = image
        view.addSubview(imageview)
        
        
        let libraryPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.userDomainMask, true)[0]
        print("沙盒地址：\(libraryPath)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}






