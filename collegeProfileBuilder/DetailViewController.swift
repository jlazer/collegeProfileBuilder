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
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(collegeDetailViewController.name)
        print(collegeDetailViewController.location)
        print(collegeDetailViewController.numberOfStudents)
        print(collegeDetailViewController.image)
        collegeImageView.image = collegeDetailViewController.image
        label1.text = collegeDetailViewController.name
        label2.text = collegeDetailViewController.location
        label3.text = collegeDetailViewController.numberOfStudents
    }

   
}
