//
//  ViewController.swift
//  insertDeletElementTableView
//
//  Created by mac on 30/08/2016.
//  Copyright © 2016 Rachidovitch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddToItemsViewControllerDelegate {
    
        var myList = [todoItems]()
    // Mark : add ibOubtlet
    
    @IBOutlet weak var mytableView: UITableView!

    // Mark : add methods
    
    func addNew(todo: todoItems) {
        
        myList.append(todo)
        
        mytableView.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let t = todoItems(name: "Rachid", note: "Casablanca")
        
        myList.append(t)
        
        myList.append(todoItems(name: "Mounir", note: "Rabat"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Mark : add a Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("identifier", forIndexPath: indexPath)
    
        let todo = myList[indexPath.row]
        
        cell.textLabel?.text = todo.name
        
        cell.detailTextLabel?.text = todo.note
        
        return cell
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "add" {
            
            let desVc = segue.destinationViewController as! addTodoItemsViewController
            
            desVc.delegate = self
        }
    }
    

    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            myList.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
    }

    

}

