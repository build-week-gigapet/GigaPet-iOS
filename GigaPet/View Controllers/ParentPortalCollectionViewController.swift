//
//  ParentPortalCollectionViewController.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ChildCell"
private var apiController = ApiController()

class ParentPortalCollectionViewController: UICollectionViewController {
    
    //
    // MARK: - IBOutlets and Properties
    //
    
    @IBOutlet weak var childName: UILabel!
    @IBOutlet weak var childImage: UIImageView!

    //
    // MARK: - View LifeCycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        self.reloadInputViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if apiController.bearer == nil { //
            performSegue(withIdentifier: "LoginViewModalSegue", sender: self)
        }
    }
    
    //
    // MARK: UICollectionViewDataSource
    //

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apiController.children.count
    }
    var indexpath: Int = 0
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ChildCollectionViewCell else { return UICollectionViewCell() }
    
        return cell
    }
    
    //
    // MARK: - IBActions and Methods
    //
    
    @IBAction func addChildButtonPressed (_ sender: UIButton) {
    
    }
    
    @IBAction func logoutButtonPressed (_ sender: UIButton) {
        
    }
    
    
    //
    // MARK: - Navigation
    //
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddChildSegue" {
            if let addChildVC = segue.destination as? AddChildViewController {
                addChildVC.apiController = apiController
            }
        }else if segue.identifier == "ShowChildSegue" {
            
            if let detailVC = segue.destination as? ChildViewController {
                if let indexPathArray = collectionView.indexPathsForSelectedItems,
                   let indexPath = indexPathArray.first {
                    detailVC.child = apiController.children[indexPath.row]
                }
                detailVC.apiController = apiController
                
            
            }
            
        }
    }

    @IBAction func unwindToParent(_ sender: UIStoryboardSegue) {
        
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

   

}
