//
//  MealGridViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by Subomi Popoola on 4/9/20.
//  Copyright © 2020 Ayo . All rights reserved.
//

import UIKit

class MealGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var appLogo: UIImageView!
    @IBOutlet var welcomePoster: UIImageView!
    @IBOutlet var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing) / 2
        layout.itemSize = CGSize(width: width, height: width * 3 / 4)
        
        searchBar.delegate = self
       
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func swipeRecognizer(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        UIView.animate(withDuration: 0.2, animations: {
            self.searchBar.frame = CGRect(x: self.searchBar.frame.origin.x,
                                          y: self.searchBar.frame.origin.y - 400,
                                          width: self.searchBar.frame.size.width,
                                          height: self.searchBar.frame.size.height)
         
         self.collectionView.frame = CGRect(x: self.collectionView.frame.origin.x,
                                            y: self.collectionView.frame.origin.y - 400,
                                            width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height + 300)
            self.appLogo.alpha = 0
            self.welcomePoster.alpha = 0
            self.greetingLabel.alpha = 0
        })
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        var newFrame: CGRect = self.searchBar.frame
        newFrame.origin.y += 400
        var viewFrame: CGRect = self.collectionView.frame
        viewFrame.origin.y += 400
        viewFrame.size.height -= 300
        
        UIView.animate(withDuration: 0.2, animations: {
            self.searchBar.frame = newFrame
            self.collectionView.frame = viewFrame
            
            self.appLogo.alpha = 1
            self.welcomePoster.alpha = 1
            self.greetingLabel.alpha = 1
        })
    }
           
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealGridCell", for: indexPath) as! MealGridCell
        
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
