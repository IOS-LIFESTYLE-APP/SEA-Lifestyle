//
//  StartCookingViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/10/20.
//  Copyright © 2020 Ayo . All rights reserved.
//
//
//import UIKit
//
//struct ContentView : View {
   

   
       override func viewDidLoad() {
          super.viewDidLoad()
   
//          let url = URL(string:  "https://api.spoonacular.com/recipes/search&apiKey=a5adb8848cf447679fcce3994122a14f")!

class StartCookingViewController: UIViewController {
    
    GET https://api.spoonacular.com/recipes/random?number=1&tags=vegetarian
    
    {
        "recipes":[
            {/* recipe data as in Get Recipe Information endpoint */}
        ]
    }
    
        func loadRecipeData(){
            let foodID = food["id"] as! Int
            let FoodID = String(foodID)
            let url = URL(string: "https://api.spoonacular.com/recipes/" + FoodID + "/recipeWidget.json?apiKey=a5adb8848cf447679fcce3994122a14f")!
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
                
               
               if let error = error {
                  print(error.localizedDescription)
               } else if let data = data {
                  let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                self.foodData = dataDictionary["recipe"] as! [[String:Any]]
                self.tableView.reloadData()
               }
                
            }
            task.resume()
        }
        
         }
           
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           self.foodData.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "CookViewController", for: indexPath) as! IngredientsCell
           let ingredient = foodData[indexPath.row]
           cell.ingredientLabel.text = ingredient["name"] as? String
           let ingredientURL = ingredient["image"] as! String
           let urlString = "https://spoonacular.com/cdn/recipes_100x100/" + ingredientURL
     
           let url = URL(string: urlString)
           if (url != nil){
                   cell.ingredientsImage.af_setImage(withURL: url!)

           }
           return cell
       }
//        // Do any additional setup after loading the view.
    }
//    
//    @IBAction func backButton(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
