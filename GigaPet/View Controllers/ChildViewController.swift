//
//  ChildViewController.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    //
    // MARK: - IBOutlets and Properties
    //
    
    
    
    var apiController: ApiController?
    var child: Child? {
        didSet {
            
        }
    }
    var foodEatenToday: [FoodEntry] = []
    var foodEatenWeek: [FoodEntry] = []
    var foodEatenMonth: [FoodEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
