//
//  ViewController.swift
//  Class 5
//
//  Created by Nathan Birkholz on 8/18/14.
//  Copyright (c) 2014 Nathan Birkholz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var firstLoad = true
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        
        var vikings = UIImage(named: "13360335491904078261viking cut-md")
        
        self.imageView.image = vikings
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if firstLoad == true {
            firstLoad = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: UITextFiekdDelegate
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
    @IBAction func photoButtonPressed(sender: UIButton) {
        
        var imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary // .camera
        
        self.presentViewController(imagePickerController, animated: true, completion: nil /* fore some code*/)
        
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        
        
    }
    
    // MARK: UIImagePickerController
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        // gets fired when image picker is done
        println("user picked an image")
        
        var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = editedImage
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        // fired when user cancels
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

