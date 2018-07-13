//
//  Fixser+CoreDataProperties.swift
//  BicycleRepairs
//
//  Created by gemaojing on 2018/5/31.
//  Copyright © 2018年 葛茂菁. All rights reserved.
//
//

import Foundation
import CoreData


extension Fixser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fixser> {
        return NSFetchRequest<Fixser>(entityName: "Fixser")
    }

    @NSManaged public var titleA: String?
    @NSManaged public var imageA: NSData?

}
