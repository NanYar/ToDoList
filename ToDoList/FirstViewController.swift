//
//  FirstViewController.swift
//  ToDoList
//
//  Created by NanYar on 16.11.14.
//  Copyright (c) 2014 NanYar. All rights reserved.
//

import UIKit

var toDoItemsArray: [String] = []


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tasksTableView: UITableView!
 
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // Refresh the tasksTableView each time the view will appear
    override func viewWillAppear(animated: Bool)
    {
        // Optional Binding of "toDoItems":
        if let storedToDoItemsAnyObject: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems")
        {
            // reset toDoItemsArray
            toDoItemsArray = []
            // Umwandeln von storedToDoItemsAnyObject (= Type AnyObject) in toDoItemsArray (= Type Array)
            for var item = 0; item < storedToDoItemsAnyObject.count; item++
            {
                toDoItemsArray.append(storedToDoItemsAnyObject[item] as NSString)
            }
        }
        tasksTableView.reloadData()
    }

        
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return toDoItemsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel.text = toDoItemsArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            toDoItemsArray.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoItemsArray, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTableView.reloadData()
        }
    }
}
