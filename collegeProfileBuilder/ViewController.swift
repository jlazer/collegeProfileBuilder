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
        let college1 = College(Name: "Cal Poly Pomona", Location: "Pomona, CA", NumberOfStudents: "23,717", Image: image1!)
        let college2 = College(Name: "University Of California Santa Barbara", Location: "Isla Vista, CA", NumberOfStudents: "23,051", Image: image2!)
        let college3 = College(Name: "University Of California San Diego", Location: "La Jolla, CA", NumberOfStudents: "31,502", Image: image3!)
        collegeArray.append(college1)
        collegeArray.append(college2)
        collegeArray.append(college3)
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        let currentCollege = collegeArray[indexPath.row]
        currentCell.textLabel!.text = currentCollege.name
        return currentCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeArray.count
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! DetailViewController
        let currentRow = myTableView.indexPathForSelectedRow?.row
        NVC.collegeDetailViewController = collegeArray[currentRow!]
    }

}