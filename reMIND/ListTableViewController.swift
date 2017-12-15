//
//  ListTableViewController.swift
//  reMIND
//
//  Created by Cristina Sánchez Barreiro on 15/12/2017.
//  Copyright © 2017 CrisBarreiro. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var taskManager = TaskManager.sharedInstance
    
    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New Task", message: "Task Name", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        
        let alertAction = UIAlertAction(title: "Save", style: .default) { (alertAction) in
            if let text = alertController.textFields?.first?.text {
                self.taskManager.tasks.append(["title": text])
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let taskCell: TaskCell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! TaskCell
        let task = taskManager.tasks[indexPath.row]
        taskCell.lblTask.text = task["title"]
        if let image = task["icon"] {
            taskCell.imgTask.image = UIImage(named: image)
        } else {
            taskCell.imgTask.image = UIImage(named: "img_no_icon")
        }
        return taskCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let complete = UITableViewRowAction(style: .normal, title: "Complete") { (action, indexPath) in
            self.taskManager.tasks.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        complete.backgroundColor = #colorLiteral(red: 0.8, green: 0.9725490196, blue: 0.9529411765, alpha: 1)
        
        return [complete]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
