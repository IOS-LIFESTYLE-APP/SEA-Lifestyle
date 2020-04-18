//
//  StepsViewController.swift
//  iOS_SEA_LIFESTYLE
//
//  Created by user168008 on 4/17/20.
//  Copyright © 2020 Ayo . All rights reserved.
//
import Foundation
import UIKit
import Combine

final class StepsViewController: BindableObject {
    
    init() {
        fetchPosts()
        
    }
    
    var posts = [Post]() {
        didSet {
            didChange.send(self)
        }
    }
    
    private func fetchPost() {
        Webservice().getAllPosts{
            self.posts = $0
    }
}

    let didChange = PassthroughSubject<PostListViewModel,Never>()
    
}
class StepsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
