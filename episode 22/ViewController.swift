//
//  ViewController.swift
//  episode 22
//
//  Created by apple on 28/06/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    var myResponse  :   JSON    =   nil
    var users   : [user]    =   []
   
    
    @IBOutlet weak var myTable: usersTable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUsers()
        
    }
    
    func fetchUsers(){
         
        APIManager.sharedInstance.getUsersFromUrl(){(userJson) -> Void in
            
            if userJson != nil {
                
                self.myResponse =   userJson
                
                for i in 0..<self.myResponse.count{
                    
                    let singleUser   =   user(userJson:self.myResponse[i])
                    self.users.append(singleUser)
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.myTable.dataSourceArray=self.users
                    
                })
                

                
            }
            
        }
        
        
    }
    
   
   
}

