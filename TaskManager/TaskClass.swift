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
    
    //Initializer
    init(taskName: String) {
        self.taskName = taskName
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
