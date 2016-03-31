//
//  DetailViewController.swift
//  collegeProfileBuilder
//
//  Created by student1 on 2/23/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var collegeDetailViewController = College()
    
    @IBOutlet weak var collegeImageView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var numberOfStudentsTextfield: UITextField!
    @IBOutlet weak var websiteTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(collegeDetailViewController.name)
        print(collegeDetailViewController.location)
        print(collegeDetailViewController.numberOfStudents)
        print(collegeDetailViewController.image)
        print(collegeDetailViewController.webpage)
        collegeImageView.image = collegeDetailViewController.image
        nameTextfield.text = collegeDetailViewController.name
        locationTextfield.text = collegeDetailViewController.location
        numberOfStudentsTextfield.text = collegeDetailViewController.numberOfStudents
        websiteTextfield.text = "\(collegeDetailViewController.webpage)"
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let NVC = segue.destinationViewController as! webpageViewController
        NVC.collegeInWebViewController = collegeDetailViewController
    }
   
}
