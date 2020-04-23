//
//  CookViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/9/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit

class CookViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    var food: [String:Any]!
    var recipeData = [[String:Any]]()
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self

        super.viewDidLoad()
        cookingData()

        // Do any additional setup after loading the view.
    }
//    https://api.spoonacular.com/recipes/324694/analyzedInstructions
    func cookingData(){
           let foodID = food["id"] as! Int
           let FoodID = String(foodID)
           let url = URL(string: "https://api.spoonacular.com/recipes/" + FoodID + "/summary?apiKey=a5adb8848cf447679fcce3994122a14f")!
           let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
           let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
           let task = session.dataTask(with: request) { (data, response, error) in
                               // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                self.recipeData = dataDictionary["title"] as! [[String : Any]]
            print(dataDictionary["summary"] as Any)
            let value = dataDictionary["summary"] as Any
            print(value)
         
                
//                print(self.recipeData)
                self.tableView.reloadData()
            }

           }
        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath) as! CookTableViewCell
             return cell
    }

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
