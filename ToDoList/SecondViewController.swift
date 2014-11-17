//
//  SecondViewController.swift
//  ToDoList
//
//  Created by NanYar on 16.11.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var toDoItemTextField: UITextField!
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        self.view.endEditing(true)
    }

    

    @IBAction func addItemButtonPressed(sender: UIButton)
    {
        toDoItemsArray.append(toDoItemTextField.text)
        //let immutableToDoItemsArray = toDoItemsArray
        //NSUserDefaults.standardUserDefaults().setObject(immutableToDoItemsArray, forKey: "toDoItems")
        NSUserDefaults.standardUserDefaults().setObject(toDoItemsArray, forKey: "toDoItems")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        
        toDoItemTextField.text = ""
        self.view.endEditing(true) // oder: toDoItemTextField.resignFirstResponder()
        
        //println(storedToDoItems)
    }
    
    
    // UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        toDoItemTextField.resignFirstResponder()
        return true
    }
    
}
