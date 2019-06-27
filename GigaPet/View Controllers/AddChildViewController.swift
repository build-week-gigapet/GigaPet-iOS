//
//  AddChildViewController.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/25/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class AddChildViewController: UIViewController {
    
    //
    // MARK: - IBOutlets and Properties
    //
    
    @IBOutlet weak var childNameTextField: UITextField!
    @IBOutlet weak var favoriteFoodTextField: UITextField!
    @IBOutlet weak var foodAlergiesTextField: UITextField!
    
    //
    // MARK: - View LifeCycle
    //
    
    var apiController: ApiController?
    var newChild: Child?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //
    // MARK: - IBActions and Methods
    //
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        if let newChildName = childNameTextField.text,
           !newChildName.isEmpty,
           let newChildFavoriteFood = favoriteFoodTextField.text,
           !newChildFavoriteFood.isEmpty,
           let newChildFoodAllergies = foodAlergiesTextField.text,
           let apiController = apiController {
            let newChild = Child(name: newChildName, favoriteFoods: newChildFavoriteFood, foodAllergies: newChildFoodAllergies, foodsEaten: nil)
            apiController.addChild(newChild: newChild) { error in
                if let error = error {
                    print("ERROR OCCURED ADDING NEW CHILD: \(error)")
                }
                DispatchQueue.main.async {
                   self.dismiss(animated: true, completion: nil)
                }
            }
            
        }
           
      
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
