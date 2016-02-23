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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let college1 = College(Name: "Cal Poly Pomona", Location: "Pomona", NumberOfStudents: "23,717", Image: <#T##UIImage#>)
        let college2 = College(Name: <#T##String#>, Location: <#T##String#>, NumberOfStudents: <#T##String#>, Image: <#T##UIImage#>)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentCell = tableView.dequeueReusableCellWithIdentifier("myCell")!
        let currentCollege = collegeArray[indexPath.row]
        currentCell.textLabel!.text = currentCollege.name
        return currentCell    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeArray.count
        
    }

    
}

