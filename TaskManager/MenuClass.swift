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
    }
    
    //Handles numeric input
    func inputNumeric(from first: Int, to last: Int) {
        var response = Int(readLine()!)
        while response == nil || response! < first || response! > last {
            print("Please input a number between \(first) and \(last).")
            response = Int(readLine()!)
        }
    }
    
}
