//
//  College.swift
//  collegeProfileBuilder
//
//  Created by student1 on 2/23/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import Foundation
import UIKit
class College
{
    var name: String
    var location: String
    var numberOfStudents: String
    var image: UIImage
    var webpage: NSURL
    
    
    
    init(Name n: String,Location l: String,NumberOfStudents ns: String,Image i: UIImage,Webpage w: NSURL)
    {
        name = n
        location = l
        numberOfStudents = ns
        image = i
        webpage = w
    
        
    }
    init()
    {
        name = ""
        location = ""
        numberOfStudents = ""
        image = UIImage()
        webpage = NSURL(string: "")!
        
    }
}