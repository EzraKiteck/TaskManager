//
//  TaskClass.swift
//  TaskManager
//
//  Created by Ezra Kiteck on 9/17/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

class Task {

    //Properties
    var taskName: String
    var complete = false
    var priority: Priority
    var completeDate = Date()
    
    //Initializer
    init(taskName: String, priority: Priority) {
        self.taskName = taskName
        self.priority = priority
    }
    
}

enum Priority: Int {
    case High = 3
    case Medium = 2
    case Low = 1
}
