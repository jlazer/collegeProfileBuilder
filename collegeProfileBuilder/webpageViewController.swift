//
//  webpageViewController.swift
//  collegeProfileBuilder
//
//  Created by student1 on 3/18/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class webpageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var request = NSURLRequest(currentCollege.webpage)
        
    }

   
    @IBAction func dismissOnTap(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
   
}
