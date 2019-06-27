//
//  AddFoodViewController.swift
//  GigaPet
//
//  Created by Jake Connerly on 6/26/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController {
    
    //
    //MARK: - IBOutlets and Properties
    //
    
    @IBOutlet weak var foodDescriptionTextField: UITextField!
    @IBOutlet weak var dateAddedPicker: UIDatePicker!
    @IBOutlet weak var foodCategoryPicker: UIPickerView!

    var child: Child?
    var apiController: ApiController?
    var childIndex: Int?
    let categoryArray = ["Protein", "Dairy", "Grains", "Vegetables", "Fruit", "Sweets"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.foodCategoryPicker.delegate = self
        self.foodCategoryPicker.dataSource = self
    }
    
    @IBAction func saveButtonTapped (_ sender: UIButton) {
        if let newFoodName = foodDescriptionTextField.text,
            !newFoodName.isEmpty {
            let dateAdded = dateAddedPicker.date
            let foodCategory = foodCategoryPicker.selectedRow(inComponent: 0)
            
            let newFoodItem = FoodEntry(name: newFoodName, category: foodCategory, date_added: dateAdded)
            guard let apiController = apiController,
                  let parent = apiController.parent,
                  let children = parent.children,
                  let childIndex = childIndex else { return }
            let selectedChild = children[childIndex]
            apiController.addFoodItem(foodItem: newFoodItem, for: selectedChild) { error in
                if let error = error {
                    print("ERROR OCCURED ADDING FOOD ITEM: \(error)")
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

extension AddFoodViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return categoryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryArray[row]
    }
}

extension AddFoodViewController: UIPickerViewDelegate{
}


