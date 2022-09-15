//
//  ToDoListItem+CoreDataProperties.swift
//  CoreDataToDoList
//
//  Created by aleksandar on 10.1.22..
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date

}

extension ToDoListItem : Identifiable {

}
