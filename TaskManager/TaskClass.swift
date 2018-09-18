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
    
    //Initializer
    init(taskName: String, priority: Priority) {
        self.taskName = taskName
        self.priority = priority
    }
    
    //Completes Task
    func CompleteTask() {
        if !complete {
            complete = true
        }
    }
    
    //Sets Task to Incomplete - (May not use this function...)
    func UncompleteTask() {
        if complete {
            complete = false
        }
    }
    
}

enum Priority: Int {
    case High = 3
    case Medium = 2
    case Low = 1
}
