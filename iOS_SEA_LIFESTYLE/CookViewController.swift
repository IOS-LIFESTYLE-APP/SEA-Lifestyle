//
//  CookViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/9/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit
import Parse

class CookViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var food: [String:Any]!

    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func buttonPressed(_ sender: Any) {
        likeButton.setImage(UIImage(named:"like_icon"), for: UIControl.State.normal)
        let alert = UIAlertController(title: "Thank you!", message: "Your feedback is important to us! Feel free to continue browsing SEALifestyle.", preferredStyle: .alert)
                           alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                           self.present(alert, animated: true)
    }
    
    @IBOutlet weak var likeButton: UIButton!
    
   
    var recipeData = [[String:Any]]()
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
// How to Query Parse database
//        let query = PFQuery(className:" ")
//        query.includeKeys([""])
//        query.limit = 20
//        query.findObjectsInBackground { (likes, error) in
//        if likes != nil {
//            self.likes = likes!
//            self.tableView.reloadData()
//            }
//        }

        super.viewDidLoad()
        cookingData()

        // Do any additional setup after loading the view.
    }
    
    func cookingData(){
           let foodID = food["id"] as! Int
           let FoodID = String(foodID)
           
           let url = URL(string: "https://api.spoonacular.com/recipes/" + FoodID + "/analyzedInstructions?apiKey=a5adb8848cf447679fcce3994122a14f")!
           let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
           let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
           let task = session.dataTask(with: request) { (data, response, error) in
                               // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
                //Seems like there is no dataDictionary for rice Krispies
                
                if dataDictionary.count == 0{
                    let alert = UIAlertController(title: "Sorry!", message: "We do not currently have data for this food item. Please check back later", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    print(FoodID)
                    
                }else{
                    self.recipeData = dataDictionary[0]["steps"] as! [[String : Any]]
                    print(self.recipeData)

                    self.tableView.reloadData()
                    
                }

     
            }

           }
        task.resume()
    }

    
//    var liked: Bool = false
//
//    func setLike(_ isLiked:Bool){
//        liked = isLiked
//        if (liked) {
//            likeButton.setImage(UIImage(named:"like_icon"), for: UIControl.State.normal)
//        }
//    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeData.count
     
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath) as! CookTableViewCell
//        cell.layer.cornerRadius = 10
//        cell.layer.borderColor = tableView.backgroundColor?.cgColor
        
        let steps = recipeData[indexPath.row]
        let info = steps["step"] as? String
        cell.recipeLabel.text = info
        
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
