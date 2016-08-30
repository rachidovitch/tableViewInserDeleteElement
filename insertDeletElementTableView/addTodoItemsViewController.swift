//
//  addTodoItemsViewController.swift
//  insertDeletElementTableView
//
//  Created by mac on 30/08/2016.
//  Copyright © 2016 Rachidovitch. All rights reserved.
//

import UIKit

protocol AddToItemsViewControllerDelegate{
    func addNew(todo: todoItems)
}

class addTodoItemsViewController: UIViewController {
    
    var delegate: AddToItemsViewControllerDelegate!
    
    // Mark: Add IBOutlet
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // Mark: Add IBAction

    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        
        let todo = todoItems(name: nameTextField.text!, note: phoneNumberTextField.text!)
        
        delegate.addNew(todo)
    }
    
    

}
