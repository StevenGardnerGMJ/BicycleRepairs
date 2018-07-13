//
//  KeepViewController.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/24.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit
//
class KeepViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
       
        let title = "周杰伦"
        let imagee = #imageLiteral(resourceName: "骑友圈45x45")
        addCoreData(title: title, image: imagee)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}






