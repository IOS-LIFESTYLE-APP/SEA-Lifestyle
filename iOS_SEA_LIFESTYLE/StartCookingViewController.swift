//
//  StartCookingViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Ayo  on 4/10/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit

struct ContentView : View {
    
   @state var model = PostListViewModel()
    
 
    var body: some View{
        List(model.posts) { post in
            Text(post.title)
    }
}
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
class StartCookingViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        let url = URL(string: "https://api.spoonacular.com/recipes/search&apiKey=a5adb8848cf447679fcce3994122a14f")!
        
        print(intructions)
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
