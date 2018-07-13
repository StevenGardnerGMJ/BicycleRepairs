//
//  CoreDataTools.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/30.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public let application = UIApplication.shared
 let appDelegate = application.delegate as! AppDelegate
///CoreData操作
let EntityName = "Fixser"
// 增
func addCoreData(title:String, image:UIImage) {
    let entity = NSEntityDescription.insertNewObject(forEntityName: EntityName, into: appDelegate.managedObjectContext) as! Fixser
    entity.titleA = title
    entity.imageA = UIImagePNGRepresentation(image) as NSData?
    do
    {
        try appDelegate.managedObjectContext.save()
        print("添加成功 ~ ~ ")
    } catch {
        print("添加失败！！")
    }
}
// 删
func deleteCoreData(){
    let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: EntityName)
    let condition = "name='周杰伦'"
    let predicate = NSPredicate(format: condition, "")
    request.predicate = predicate
    do{
        //查询满足条件的联系人
        let resultsList = try appDelegate.managedObjectContext.fetch(request) as! [Fixser] as NSArray
        if resultsList.count != 0 {//若结果为多条，则只删除第一条，可根据你的需要做改动
            appDelegate.managedObjectContext.delete(resultsList[0] as! NSManagedObject)
            try appDelegate.managedObjectContext.save()
            print("delete success ~ ~")
        }else{
            print("删除失败！ 没有符合条件的联系人！")
        }
    }catch{
        print("delete fail !")
    }
    
}

// 改
func updateDataWithCoreData() {
    let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: EntityName)
    let entity:NSEntityDescription = NSEntityDescription.entity(forEntityName: EntityName, in: appDelegate.managedObjectContext)!
    
    let condition = "name='周杰伦'"
    let predicate = NSPredicate(format: condition,"")
    request.entity = entity
    request.predicate = predicate
    do{
        let userList = try appDelegate.managedObjectContext.fetch(request) as! [Fixser] as NSArray
        if userList.count != 0 {
            let user = userList[0] as! Fixser
            user.titleA = "小公举"
            try appDelegate.managedObjectContext.save()
            print("修改成功 ~ ~")
        }else{
            print("修改失败，没有符合条件的联系人！")
        }
    }catch{
        print("修改失败 ~ ~")
    }
    
}

// 查
func selectDataFromCoreData() -> NSArray {
    var dataSource = NSArray()
    let request : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
    let entity:NSEntityDescription? = NSEntityDescription.entity(forEntityName: EntityName, in: appDelegate.managedObjectContext)
    request.entity = entity
    do{
        dataSource = try appDelegate.managedObjectContext.fetch(request) as! [Fixser] as NSArray
        print("数据读取成功 ~ ~")
    }catch{
        print("get_coredata_fail!")
    }
    
    return dataSource
    //获取管理的数据上下文 对象
//    let app = UIApplication.shared.delegate as! AppDelegate
//    if #available(iOS 10.0, *) {
//        let context = app.persistentContainer.viewContext
//    } else {
//        // Fallback on earlier versions
//    }
//
//    //声明数据的请求
//    let fetchRequest = NSFetchRequest<Fixser>(entityName:EntityName)
//    fetchRequest.fetchLimit = 10 //限定查询结果的数量
//    fetchRequest.fetchOffset = 0 //查询的偏移量
//
//
//    let arr = Array<Any>()
//    return arr
}

// 打印所有数据
func printAllDataWithCoreData() {
    let array = selectDataFromCoreData()
    for item in array {
        let user = item as! Fixser
        print("name=",user.titleA)
    }
}





