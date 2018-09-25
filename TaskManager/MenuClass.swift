//
//  MenuClass.swift
//  TaskManager
//
//  Created by Ezra Kiteck on 9/17/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

class Menu {
    
    var running = true
    
    //Prints Options
    func PrintMenu() {
            print("""
        What would you like to do?
        1. Create a Task        2. Delete a Task
        3. Complete a Task      4. Set Task as Incomplete
        5. List Complete Tasks  6. List Incomplete Tasks
        7. List All Tasks       8. Change Priority
        9. Quit
        """)
        
        switch inputNumeric(from: 1, to: 8) {
        case 1:
            createTask()
        case 2:
            deleteTask()
        case 3:
            completeTask()
        case 4:
            incompleteTask()
        case 5:
            listCompleteTasks()
        case 6:
            listIncompleteTasks()
        case 7:
            listAllTasks()
        case 8:
            changePriority()
        case 9:
            Quit()
        default:
            print("This message should not show up. Ever.")
        }
    }
    
    //Handles numeric input
    func inputNumeric(from first: Int, to last: Int) -> Int {
        var response = Int(readLine()!)
        while response == nil || response! < first || response! > last {
            if response == 49 {
                print("This is the wrong number!  The wrong number song!")
                sleep(1)
                print("We're very very sorry that you got it wrong!")
                sleep(2)
            }
            if response! < 0 {
                print("Do you really think that's an option, or are you trying to break the program?")
            }
            if response! > 9000 {
                print("YOUR RESPONSE IS OVER 9000!!!")
            }
            print("Please input a number between \(first) and \(last).")
            response = Int(readLine()!)
        }
        return response!
    }
    
    //Handles string input
    func inputString() -> String {
        var response = readLine()
        while response == nil {
            print("Please enter a valid input.")
            response = readLine()
        }
        if response == "exit code: 9" {
            print("Yeah, it doesn't work like that my friend.")
            sleep(1)
        }
        if response == "ninja pineapple" {
            print("[Insert awesome motto here]")
            sleep(1)
        }
        return response!
    }
    
    //Handles Priority Input
    func inputPriority() -> Priority {
        print("What will the priority of this task be?")
        print("""
         1: High
         2: Medium
         3: Low
        """)
        let response = inputNumeric(from: 1, to: 3)
        switch response {
        case 1:
            return .High
        case 2:
            return .Medium
        case 3:
            return .Low
        default:
            print("This message should not ever appear.")
        }
        return .Medium
    }
    
    //Creates a Task
    func createTask() {
        print("What will the name of the task be?")
        let task = Task(taskName: inputString(), priority: inputPriority())
        print("In how many days do you want to accomplish this task?")
        task.completeDate = Calendar.current.date(byAdding: .day, value: inputNumeric(from: 0, to: 365), to: task.completeDate)!
        //print(dateFormatter.string(from: task.completeDate))
        taskList.append(task)
        print("'\(task.taskName)' added. \n")
        taskList.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
    }
    
    //Deletes a Task
    func deleteTask() {
        for i in 0..<taskList.count {
            print(" \(i): \(taskList[i].taskName)")
        }
        print("Enter the index of the task you want to delete.")
        let response = inputNumeric(from: 0, to: taskList.count - 1)
        print("'\(taskList[response].taskName)' has been deleted. \n")
        taskList.remove(at: response)
    }
    
    //Completes a Task
    func completeTask() {
        var total = 0
        for i in 0..<taskList.count {
            if taskList[i].complete == false {
                print(" \(i): \(taskList[i].taskName)")
                total += 1
            }
        }
        if total == 0 {
            print("There are no tasks to complete.")
        } else {
            print("Enter the index of the task you want to complete.")
            var response = inputNumeric(from: 0, to: taskList.count - 1)
            while taskList[response].complete == true {
                print("Please enter a task listed.")
                response = inputNumeric(from: 0, to: taskList.count - 1)
            }
            print("'\(taskList[response].taskName)' has been marked as complete. \n")
            taskList[response].complete = true
        }
    }
    
    //Marks task as incomplete
    func incompleteTask() {
        var total = 0
        for i in 0..<taskList.count {
            if taskList[i].complete == true {
                print(" \(i): \(taskList[i].taskName)")
                total += 1
            }
        }
        if total == 0 {
            print("There are no tasks to mark as incomplete.")
        } else {
            print("Enter the index of the task you want to mark as incomplete.")
            var response = inputNumeric(from: 0, to: taskList.count - 1)
            while taskList[response].complete == false {
                print("Please enter a task listed.")
                response = inputNumeric(from: 0, to: taskList.count - 1)
            }
            print("'\(taskList[response].taskName)' has been marked as incomplete. \n")
            taskList[response].complete = false
        }
    }
    
    //Changes Priority of a task
    func changePriority() {
        var total = 0
        for i in 0..<taskList.count {
            print(" \(i): \(taskList[i].taskName)  ·\(taskList[i].priority) Priority·")
            total += 1
        }
        if total == 0 {
            print("You don't have any tasks! Try creating some.")
        } else {
            print("Enter the index of the task you want to edit.")
            let response = inputNumeric(from: 0, to: taskList.count - 1)
            taskList[response].priority = inputPriority()
            print("'\(taskList[response].taskName)' has been marked as \(taskList[response].priority) priority. \n")
        }
        taskList.sort(by: {$0.priority.rawValue > $1.priority.rawValue})
    }
    
    //Lists All Complete Tasks
    func listCompleteTasks() {
        var total = 0
        for item in taskList {
            if item.complete == true {
                print(" - \(item.taskName)  ·\(item.priority) Priority·")
                total += 1
            }
        }
        if total == 0 {
            print("You have no completed tasks!")
        }
        print("")
    }
    
    //Lists All Incomplete Tasks
    func listIncompleteTasks() {
        var total = 0
        for item in taskList {
            if item.complete == false {
                print(" - \(item.taskName)  ·\(item.priority) Priority·  Due on\(dateFormatter.string(from: item.completeDate))")
                total += 1
            }
        }
        if total == 0 {
            print("You have completed all of your tasks!")
        }
        print("")
    }
    
    //Lists All Tasks
    func listAllTasks() {
        for item in taskList {
            print(" - \(item.taskName)  ·\(item.priority) Priority·")
        }
        print("")
    }
    
    //Quits Application
    func Quit() {
        print("Quitting Application. Thanks for using Task Manager!")
        running = false
    }
}
