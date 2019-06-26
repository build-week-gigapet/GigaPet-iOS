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
    
    @IBOutlet weak var favoriteFoodLabel: UILabel!
    @IBOutlet weak var foodAllergyLabel: UILabel!
    @IBOutlet weak var dateSegmentedControl: UISegmentedControl!
    @IBOutlet weak var foodItemTableView: UITableView!
    
    var apiController: ApiController?
    var child: Child? {
        didSet {

        }
    }
    var foodEatenToday: [FoodEntry] = []
    var foodEatenWeek: [FoodEntry] = []
    var foodEatenMonth: [FoodEntry] = []
    let sections: [String] = ["Protein", "Dairy", "Grains", "Vegetables", "Fruit", "Sweets"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodItemTableView.delegate = self
        self.foodItemTableView.dataSource = self
    }
}

extension ChildViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sections[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildCell", for: indexPath)
        return cell
    }
}

extension ChildViewController: UITableViewDelegate {
    
}


/*
 var proteinCount = 0
 var dairyCount = 0
 var grainsCount = 0
 var vegetableCount = 0
 var fruitCount = 0
 var sweetsCount = 0
 if let apiConroller = apiController {
 for childDetail in apiConroller.childDetailArray {
 for food in childDetail.foodsEaten {
 switch food.category {
 case 0:
 proteinCount += 1
 return proteinCount
 case 1:
 dairyCount += 1
 return dairyCount
 case 2:
 grainsCount += 1
 return grainsCount
 case 3:
 vegetableCount += 1
 return vegetableCount
 case 4:
 fruitCount += 1
 return fruitCount
 case 5:
 sweetsCount += 1
 return sweetsCount
 }
 }
 }
 }
 
 */
