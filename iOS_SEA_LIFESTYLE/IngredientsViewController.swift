//
//  IngredientsViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/9/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit
import AlamofireImage

class IngredientsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
    var food: [String:Any]!
    var baseUrlImage: String!
    
    var foodData = [[String:Any]]()
    
    @IBOutlet var foodName: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var circularImage: UIImageView!
    
   
    
    override func viewDidLoad() {
        circularImage.layer.masksToBounds = true
        circularImage.layer.cornerRadius = circularImage.bounds.width / 2
        circularImage.layer.borderWidth = 5
        circularImage.layer.borderColor = UIColor.cyan.cgColor
     
        foodName.text = food["title"] as? String
        
        let foodURL = food["image"] as! String
        let urlString = baseUrlImage + foodURL
        let url = URL(string: urlString)
        if (url != nil){
            circularImage.af_setImage(withURL: url!)
            
        }
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        loadRecipeData()
    
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadRecipeData(){
        let foodID = food["id"] as! Int
        let FoodID = String(foodID)
        let url = URL(string: "https://api.spoonacular.com/recipes/" + FoodID + "/ingredientWidget.json?apiKey=a5adb8848cf447679fcce3994122a14f")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            self.foodData = dataDictionary["ingredients"] as! [[String:Any]]
            self.tableView.reloadData()
           }
            
        }
        task.resume()
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.foodData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsCell", for: indexPath) as! IngredientsCell
        let ingredient = foodData[indexPath.row]
        cell.ingredientLabel.text = ingredient["name"] as? String
        let ingredientURL = ingredient["image"] as! String
        let urlString = "https://spoonacular.com/cdn/ingredients_100x100/" + ingredientURL
  
        let url = URL(string: urlString)
        if (url != nil){
                cell.ingredientsImage.af_setImage(withURL: url!)

        }
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let nutritionViewController = segue.destination as! NutritionViewController
         nutritionViewController.food = food
         nutritionViewController.baseUrlImage = baseUrlImage
     }
    
    
    
    

    
    
}

