//
//  FirstViewController.swift
//  To Do List
//
//  Created by Jesus Lopez de Nava on 7/8/15.
//  Copyright (c) 2015 LodenaApps. All rights reserved.
//

import UIKit

var arrItems = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("storedArray") != nil {
            
            arrItems = NSUserDefaults.standardUserDefaults().objectForKey("storedArray") as! [String]
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrItems.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = arrItems[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            arrItems.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(arrItems, forKey: "storedArray")
            
            // This is one way to do  it:
            
            // myTable.reloadData()
            
            // This is another way to do it:
            
            myTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {

        myTable.reloadData()
        
    }

}

    