//
//  ImagePostViewController.swift
//  InstagramDemo
//
//  Created by Azizur Rahman on 3/21/16.
//  Copyright © 2016 Azizur Rahman. All rights reserved.
//

import UIKit

class ImagePostViewController: UIViewController {
    
    var importedImage: UIImage?
    var captionText: String?
    
    @IBOutlet weak var captionField: UITextField!
    @IBOutlet weak var selectedImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedImageView.image = importedImage
        captionText = captionField.text
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubmit(sender: AnyObject) {
        
        captionText = captionField.text
        
        // Do something with the images (based on your use case)
        
    Post.postUserImage(importedImage, withCaption: captionText) { (success: Bool, error: NSError?) -> Void in
            if success {
                print("Image Uploaded")
                
            }
            if ( error != nil) {
                print(error?.localizedDescription)
            }
        }
    self.dismissViewControllerAnimated(true, completion: nil)
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
