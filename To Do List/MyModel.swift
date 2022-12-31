//
//  MyModel.swift
//  To Do List
//
//  Created by Labib Khan on 12/27/22.
//

import Foundation
class MyModel{
    
    var id : String?
    var taskName: String?
    var date: String?
    var priority: String?
    var identifier: String?
    init(id: String?, taskName: String? , date: String?, priority: String?, identifier: String?) {
        self.id = id;
        self.taskName = taskName;
        self.date = date;
        self.priority = priority
        self.identifier = identifier
    }
}
