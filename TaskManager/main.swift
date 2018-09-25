//
//  main.swift
//  TaskManager
//
//  Created by Ezra Kiteck on 9/17/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = " MM/dd/yyyy"

let task1 = Task(taskName: "Complete Task Manager", priority: .High)
let task2 = Task(taskName: "Take out the Trash", priority: .Medium)

var taskList = [task2, task1]
taskList.sort(by: {$0.priority.rawValue > $1.priority.rawValue})

let mainMenu = Menu()

while mainMenu.running {
    mainMenu.PrintMenu()
}
