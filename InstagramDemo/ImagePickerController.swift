//
//  ImagePickerController.swift
//  InstagramDemo
//
//  Created by Azizur Rahman on 3/20/16.
//  Copyright © 2016 Azizur Rahman. All rights reserved.
//

import UIKit

class ImagePickerController: UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
*/
        
        delegate = self.delegate
        self.allowsEditing = true
        self.sourceType = UIImagePickerControllerSourceType.Camera
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
