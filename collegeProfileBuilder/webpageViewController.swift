//
//  webpageViewController.swift
//  collegeProfileBuilder
//
//  Created by student1 on 3/18/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class webpageViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    var collegeInWebViewController = College()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var request = NSURLRequest(URL: collegeInWebViewController.webpage)
        myWebView.loadRequest(request)
    }

   
    @IBAction func dismissOnTap(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
   
}
