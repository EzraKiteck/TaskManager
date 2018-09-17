//
//  MenuClass.swift
//  TaskManager
//
//  Created by Ezra Kiteck on 9/17/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

class Menu {
    
    //Prints Options
    func PrintMenu() {
            print("""
        What would you like to do?
        1. Create a Task        2. Delete a Task
        3. List Complete Tasks  4. List Incomplete Tasks
        5. List All Tasks       6. Quit
        """)
        
        switch inputNumeric(from: 1, to: 6) {
        case 1:
            print("Create a Task")
        case 2:
            print("Delete a Task")
        case 3:
            print("List Complete Tasks")
        case 4:
            print("List Incomplete Tasks")
        case 5:
            print("List All Tasks")
        case 6:
            print("Quit")
        default:
            print("This message should not show up. Ever.")
        }
    }
    
    //Handles numeric input
    func inputNumeric(from first: Int, to last: Int) -> Int {
        var response = Int(readLine()!)
        while response == nil || response! < first || response! > last {
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
        return response!
    }
    
}
