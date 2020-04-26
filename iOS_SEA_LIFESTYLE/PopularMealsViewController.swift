//
//  PopularMealsViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Subomi Popoola on 4/9/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit
import Parse

class PopularMealsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var foodData = [[String:Any]]()
    var Id: Int!
    var foodSummary: String!
    var baseUrlImage: String!
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadFoodData()
    }
    
    func loadFoodData(){
        let url = URL(string: "https://api.spoonacular.com/recipes/search?apiKey=a5adb8848cf447679fcce3994122a14f&number=1000")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
              self.foodData = dataDictionary["results"] as! [[String:Any]]
            self.baseUrlImage = dataDictionary["baseUri"] as! String
          
            }
            self.tableView.reloadData()
           }
        task.resume()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularMealsCell", for: indexPath) as! PopularMealsCell
        let food = foodData[indexPath.row]
        cell.foodName.text = food["title"] as! String
        let foodname = food["title"] as! String
        let query = PFQuery(className:"Meals")
        query.whereKey("foodType", equalTo: foodname)
        query.countObjectsInBackground { (count: Int32, error: Error?) in
            if let error = error {
                // The request failed
                print(error.localizedDescription)
            } else {
                cell.rating.text = String(count)
               
            }
        }
       // cell.synopsisLabel.text = foodSummary as! String
        
        
        let foodURL = food["image"] as! String
        let urlString = baseUrlImage + foodURL
        let url = URL(string: urlString)
        if (url != nil){
            cell.mealPicture.af_setImage(withURL: url!)
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

}



