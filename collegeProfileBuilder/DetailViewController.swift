//
//  DetailViewController.swift
//  collegeProfileBuilder
//
//  Created by student1 on 2/23/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var collegeDetailViewController = College()
    
    @IBOutlet weak var collegeImageView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var numberOfStudentsTextfield: UITextField!
    @IBOutlet weak var websiteTextfield: UITextField!
    var picker = UIImagePickerController()
    var collegePhoto = UIImage()
    
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
        
        picker.delegate = self
        self.picker.allowsEditing = true
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let webpageConversion: NSURL = NSURL(string: websiteTextfield.text!)!
        collegeDetailViewController.webpage = webpageConversion
        return true
    }
    
    @IBAction func whenTappedPhotoLibrary(sender: UIButton) {
        let sheet = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        sheet.popoverPresentationController?.sourceView = self.view
        sheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        let libraryButton = UIAlertAction(title: "PHOTO LIBRARY", style: .Default) {(action) -> Void in
            self.picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.picker, animated: true, completion: nil)
            
        }
        sheet.addAction(libraryButton)
        self.presentViewController(sheet, animated: true, completion: nil)
    }
    
    func  imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        picker.dismissViewControllerAnimated(true) { () -> Void in
            self.collegePhoto = (info[UIImagePickerControllerEditedImage] as! UIImage)
            self.collegeDetailViewController.image = self.collegePhoto
            self.collegeImageView.image = self.collegePhoto
            
        }
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "webPageSegue"
        {
            let NVC = segue.destinationViewController as! webpageViewController
            NVC.collegeInWebViewController = collegeDetailViewController
        }
            
            
        else
        {
                
                let NVC = segue.destinationViewController as! MapViewController
                NVC.collegeInMapViewController = collegeDetailViewController
        
        }
    }
    
}
