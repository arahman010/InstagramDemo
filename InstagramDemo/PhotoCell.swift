//
//  PhotoCell.swift
//  InstagramDemo
//
//  Created by Azizur Rahman on 3/21/16.
//  Copyright © 2016 Azizur Rahman. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PhotoCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postImageView: PFImageView!
    
   
    
    
    var instagramPost: PFObject! {
        didSet {
            if let mediaData = instagramPost["media"] as? PFFile {
                self.postImageView.file = mediaData
                self.postImageView.loadInBackground()
            }
            captionLabel.text = instagramPost["caption"] as? String
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
