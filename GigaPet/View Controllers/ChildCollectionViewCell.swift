//
//  ChildCollectionViewCell.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class ChildCollectionViewCell: UICollectionViewCell {
    
    var apiController: ApiController?
    
    @IBOutlet weak var childName: UILabel!
    @IBOutlet weak var childImage: UIImageView!
    
}
