//
//  RepairsTableVC.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/7.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import UIKit

class RepairsTableVC: UITableViewController {

    var  key_struct:String!
    var  arry:NSArray! = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = key_struct
       readDic()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func readDic(){
        let di = DictModel.RWdataDic().bicycleDic
        arry = di[key_struct]
        print(arry)
        
        
    }
    
    
    
    // 结构系统 转向系统 变速系统 刹车系统 传动系统 轮组系统
    // 具体车架更换，车座更换，后座更换 山地车货架安装方法汇总
    
    // 结构系统: 车架 坐垫 坐杆 坐杆夹 后座更换
    // 转向系统：把套 车把 把立 垫圈 碗组 前叉
    // 变速系统：指拨 变速线管 前变速器 后变速器
    // 刹车系统: 刹把 刹车线管 碟刹片 来令片
    // 传动系统: 脚踏 链轮 链条 花鼓 飞轮 中轴
    // 轮组系统：车圈 辐条 辐条帽 轮胎 内胎
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repairsIdentifier", for: indexPath)

        // Configure the cell...
        let currentValue = arry[indexPath.row]
        cell.textLabel?.text = currentValue as? String
        cell.accessoryType = .disclosureIndicator
        //"因为胳膊太短了"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
