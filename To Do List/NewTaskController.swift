//
//  NewTaskController.swift
//  To Do List
//
//  Created by Labib Khan on 12/26/22.
//

import UIKit
import Firebase

class NewTaskController: UIViewController {
    
    var refTasks: DatabaseReference!

    @IBOutlet weak var taskNameField: UITextField!
    
    @IBOutlet weak var dateField: UITextField!
    
    
    @IBOutlet weak var priorityField: UITextField!
    
    @IBOutlet weak var taskStatus: UILabel!
    @IBAction func addBtn(_ sender: UIButton) {
        addTask()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refTasks = Database.database().reference().child("tasks")
    }
    
    func addTask(){
        let key2 = refTasks.childByAutoId().key
        
        let tasks = ["id": Constants.Storyboard.key,
                     "taskName": taskNameField.text! as String,
                     "date": dateField.text! as String,
                     "priority": priorityField.text! as String,
                     "identifier":key2
                    ]
        if priorityField.text == "high" || priorityField.text == "low" || priorityField.text == "medium" {
            refTasks.child(key2!).setValue(tasks)
            taskStatus.text = "Task Added Successfully!"
            
            let delay = 0.5
            perform(#selector(self.delayFunction), with: nil, afterDelay: delay)
            
        }
        else {
            taskStatus.text = "Priority can only be high,medium or low"
            let delay = 1.0
            perform(#selector(self.delayFunction), with: nil, afterDelay: delay)
        }

    }
    @objc func delayFunction(){
        taskStatus.text = ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
