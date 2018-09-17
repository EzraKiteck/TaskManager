//
//  main.swift
//  TaskManager
//
//  Created by Ezra Kiteck on 9/17/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

let task1 = Task(taskName: "Complete Task Manager")
let task2 = Task(taskName: "Take out the Trash")

var taskList = [task1, task2]

let mainMenu = Menu()

while mainMenu.running {
    mainMenu.PrintMenu()
}
