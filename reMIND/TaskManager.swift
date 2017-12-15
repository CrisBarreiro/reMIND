//
//  TaskManager.swift
//  reMIND
//
//  Created by Cristina Sánchez Barreiro on 15/12/2017.
//  Copyright © 2017 CrisBarreiro. All rights reserved.
//

import Foundation

class TaskManager {
    
    static let sharedInstance = TaskManager()
    
    var tasks : [[String : String]] = [[String : String]]()
    let key = "tasks"
    
    func save() {
        UserDefaults.standard.set(tasks, forKey: key)
    }
    
    func load() {
        if let array = UserDefaults.standard.array(forKey: key) as? [[String : String]] {
            tasks = array
        }
    }
}
