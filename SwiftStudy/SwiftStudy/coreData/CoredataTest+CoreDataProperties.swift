//
//  CoredataTest+CoreDataProperties.swift
//  SwiftStudy
//
//  Created by ChenYinHai on 2018/10/10.
//  Copyright © 2018年 陈海哥. All rights reserved.
//
//

import Foundation
import CoreData

extension CoredataTest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoredataTest> {
        return NSFetchRequest<CoredataTest>(entityName: "CoredataTest")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int64
    @NSManaged public var photo: Int64

}
