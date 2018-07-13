//
//  StructureTableViewController.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/8.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit

// 维修界面
class StructureTableViewController: UITableViewController {

    
    
    @IBOutlet weak var structureCell: UITableViewCell!
    
    @IBOutlet weak var directionCell: UITableViewCell!
    
    @IBOutlet weak var speedCell: UITableViewCell!
    
    @IBOutlet weak var breakCell: UITableViewCell!
    
    @IBOutlet weak var transmissionCell: UITableViewCell!
    
    @IBOutlet weak var wheelCell: UITableViewCell!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if  let repairsVC = segue.destination as? RepairsTableVC {
        switch segue.identifier! {
        case "结构系统" :
            repairsVC.key_struct = "结构系统"
        case "转向系统":
            repairsVC.key_struct = "转向系统"
        case "变速系统":
            repairsVC.key_struct = "变速系统"
        case "刹车系统":
            repairsVC.key_struct = "刹车系统"
        case "传动系统":
            repairsVC.key_struct = "传动系统"
        case "轮组系统":
            repairsVC.key_struct = "轮组系统"
        default:
            print("other")
        }
            
       } else { print("其他VC")}
    }
  

}
