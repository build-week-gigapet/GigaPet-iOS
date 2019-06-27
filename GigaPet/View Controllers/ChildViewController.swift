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
    
    var proteinCount = 0
    var dairyCount = 0
    var grainsCount = 0
    var vegetableCount = 0
    var fruitCount = 0
    var sweetsCount = 0
    
    var apiController: ApiController?
    var child: Child? {
        didSet {
            updateViews()
        }
    }
    var childIndex: Int?
    
    var foodEatenToday: [FoodEntry] = []
    var foodEatenWeek: [FoodEntry] = []
    var foodEatenMonth: [FoodEntry] = []
    let sections: [String] = ["Protein", "Dairy", "Grains", "Vegetables", "Fruit", "Sweets"]
    
    //
    // MARK: - View Lifycycle
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        self.foodItemTableView.delegate = self
        self.foodItemTableView.dataSource = self
    }
    
    //
    // MARK: - IBActions and Methods
    //
    
    func updateViews() {
        
        guard let child = child else { return }
        
        favoriteFoodLabel.text = child.favoriteFoods
        foodAllergyLabel.text = child.foodAllergies
        
    }
    
    //
    // MARK: - IBActions and Methods
    //
    
    @IBAction func unwindToChild(_ sender: UIStoryboardSegue) {
        
    }
    
     //
     // MARK: - Navigation
     //
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addFoodVC = segue.destination as? AddFoodViewController {
           addFoodVC.child = child
           addFoodVC.apiController = apiController
            guard let apiController = apiController else { return }
           apiController.childIndex = childIndex
        }
        
     }
    
    
}

//
// MARK: - Extensions
//

extension ChildViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sections[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let child = child,
           let foodEaten = child.foodsEaten {
            for foodItem in foodEaten {
                switch foodItem.category {
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
                default:
                    return 5
                }
            }
        }
        let sectionCountArray = [proteinCount, dairyCount, grainsCount, vegetableCount, fruitCount, sweetsCount]
         return sectionCountArray[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildCell", for: indexPath)
        return cell
    }
    

}

extension ChildViewController: UITableViewDelegate {
    
}
