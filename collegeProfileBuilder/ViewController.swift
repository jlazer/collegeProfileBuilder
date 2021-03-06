//
//  ViewController.swift
//  collegeProfileBuilder
//
//  Created by student1 on 2/22/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var collegeArray: [College] = [College]()
    var image1 = UIImage(named: "CPP_Logo")
    var image2 = UIImage(named: "UCSB_Logo")
    var image3 = UIImage(named: "UCSD_Logo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let college1 = College(Name: "Cal Poly Pomona", Location: "Pomona, CA", NumberOfStudents: "23,717", Image: image1!,Webpage: NSURL(string: "http://www.cpp.edu")!)
        let college2 = College(Name: "University Of California Santa Barbara", Location: "Isla Vista, CA", NumberOfStudents: "23,051", Image: image2!, Webpage: NSURL(string: "http://www.ucsb.edu/")!)
        let college3 = College(Name: "University Of California San Diego", Location: "La Jolla, CA", NumberOfStudents: "31,502", Image: image3!, Webpage: NSURL(string: "https://ucsd.edu/")!)
        collegeArray.append(college1)
        collegeArray.append(college2)
        collegeArray.append(college3)
        
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        let currentCollege = collegeArray[indexPath.row]
        currentCell.textLabel!.text = currentCollege.name
        //STRETCH 1
        currentCell.detailTextLabel?.text = currentCollege.location
        
        return currentCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeArray.count
        
    }
    //STRETCH 3
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            collegeArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    // STRETCH 2
    @IBAction func addCollegeBarButton(sender: UIBarButtonItem) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Add A college", message: "Please fill in the parameters", preferredStyle: .Alert)
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (name) -> Void in
            name.text = "Name Of College"
        })
        alert.addTextFieldWithConfigurationHandler({ (location) -> Void in
            location.text = "Location"
        })
        alert.addTextFieldWithConfigurationHandler({ (numberOfStudents) -> Void in
            numberOfStudents.text = "Number of students"
        })
        alert.addTextFieldWithConfigurationHandler({ (webpage) -> Void in
            webpage.text = "Webpage"
        })
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let name = alert.textFields![0] as UITextField
            let location = alert.textFields![1] as UITextField
            let numberOfStudents = alert.textFields![2] as UITextField
            let webpage = alert.textFields![3] as UITextField
            //Placing the contents of the textfields into the a buffer.
            var currentCollege1 = College()
            currentCollege1.name = name.text!
            currentCollege1.location = location.text!
            currentCollege1.numberOfStudents = numberOfStudents.text!
            let webpageConversion: NSURL = NSURL(string: webpage.text!)!
            currentCollege1.webpage = webpageConversion
            self.collegeArray.append(currentCollege1)
            self.myTableView.reloadData()
            //Printing the contents into the console so that you can see if they are recieving the text from the UITextField.
            print("Name: \(currentCollege1.name)")
            print("Location: \(currentCollege1.location)")
            print("Number of studnets: \(currentCollege1.numberOfStudents)")
        }))
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
    }
    //END OF STRETCH 2
    
    //STRETCH 3
    @IBAction func editCollegeBarButton(sender: UIBarButtonItem) {
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()
        //self.myTableView.editing = true
        
        if self.myTableView.editing
        {
            self.myTableView.editing = false
            
        }
        else
        {
            self.myTableView.editing = true
        }
    }
    //END OF STRETCH 3
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! DetailViewController
        let currentRow = myTableView.indexPathForSelectedRow?.row
        NVC.collegeDetailViewController = collegeArray[currentRow!]
    }
    
}