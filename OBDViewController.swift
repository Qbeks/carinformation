//
//  OBDViewController.swift
//  CarInformation
//
//  Created by Kamil Kubis on 18.03.2017.
//  Copyright © 2017 MobiSoft. All rights reserved.
//

import UIKit

class OBDViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var commands = [
        ["name": "ATZ", "description": "Reset device"],
        ["name": "ATRV", "description": "Get Voltage"],
        ["name": "ATM", "description": "Monitor frames"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (commands.count)
    }

    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.labelName.text = commands[indexPath.row]["name"]
        cell.labelDescription.text = commands[indexPath.row]["description"]
        
        return (cell)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
