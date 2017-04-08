//
//  ViewController.swift
//  multiView
//
//  Created by akash savediya on 28/03/17.
//  Copyright © 2017 akash savediya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var tasks : [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from core data
        getData()
        
        //reload the table view
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.isImportant{
            cell.textLabel?.text = "😂\(task.name!)"
            
        } else {
            
        
        
        cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    func getData() {
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
         print("fetching failed")
        }
    }
    
    
    
    // for deleting the row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch {
                print("fetching failed")
            }
        }
        tableView.reloadData()
    }
    
    
    

}











