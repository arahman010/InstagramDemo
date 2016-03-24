//
//  HomeViewController.swift
//  InstagramDemo
//
//  Created by Azizur Rahman on 3/19/16.
//  Copyright © 2016 Azizur Rahman. All rights reserved.
//

import UIKit
import Parse
import ParseUI



class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
    var selectedImage: UIImage?
    
    var postArray: [PFObject]?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        
        
        fetchPosts()
        tableView.reloadData()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return postArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        if ( postArray != nil ) {
        cell.instagramPost = postArray![indexPath.row]
        }
        
        return cell
    }
    
    func fetchPosts () {
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                    self.postArray = posts
            
                print("Posts achieved")
                self.tableView.reloadData()
            }
                // do something with the data fetched
            else {
                // handle error
                print(error?.localizedDescription)
            }
        }

    }
    
    override func viewDidAppear(animated: Bool) {
        fetchPosts()
        self.tableView.reloadData()
    }
    
    
    
    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        if ( PFUser.currentUser() == nil ) {
            self.performSegueWithIdentifier("HomeViewSegue", sender: nil)
            
        }
        
    }
    
    @IBAction func onUploadImage(sender: AnyObject) {
        
     
      let  imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)

    }
   
   
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            //            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            self.selectedImage = editedImage
            
            
            
            // Dismiss UIImagePickerController to go back to your original view controller
            self.dismissViewControllerAnimated(true) { () -> Void in
                self.performSegueWithIdentifier("ImagePostSegue", sender: nil)
            }
            
            
    }
    
    
    
    



    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ImagePostSegue") {
        let nav = segue.destinationViewController as! ImagePostViewController
        nav.importedImage = self.selectedImage
        
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
