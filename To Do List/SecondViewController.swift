//
//  SecondViewController.swift
//  To Do List
//
//  Created by Jesus Lopez de Nava on 7/8/15.
//  Copyright (c) 2015 LodenaApps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userItem: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var saveButton: UIButton!
    
    @IBAction func textEditingBegins(sender: AnyObject) {
        
        if resultLabel.text != nil {
        
            resultLabel.backgroundColor = UIColor.whiteColor()
            
            resultLabel.text = nil
        
            userItem.text = nil
            
            saveButton.enabled = true
            
        }
    }
    
    @IBAction func addButton(sender: AnyObject) {
        
        if userItem.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) != "" {
            
            arrItems.append(userItem.text!)
        
            NSUserDefaults.standardUserDefaults().setObject(arrItems, forKey: "storedArray")
            
            self.view.endEditing(true)
            
            resultLabel.backgroundColor = UIColor.blueColor()
            
            resultLabel.text = "Item saved successfully!!! "
            
            saveButton.enabled = false
        
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.userItem.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    
    }

}