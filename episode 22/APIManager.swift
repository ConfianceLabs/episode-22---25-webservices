//
//  APIManager.swift
//  episode 22
//
//  Created by apple on 20/08/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire




class APIManager{
    
    
    static let sharedInstance   =   APIManager()
    
   private init(){
        
    }
    
    func getUsersFromUrl(onCompletion:(JSON)-> Void) {
        
        
        
       
        
        let url =   NSURL(string: FETCH_USERS_URL)
        let request =   NSMutableURLRequest(URL: url!)
        request.HTTPMethod="GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        Alamofire.request(request).responseJSON(){ response in
            
            
            switch response.result{
                
            case.Success(let data):
                let response = JSON(data)
                //call from here
                 onCompletion(response)
            case .Failure(let error):
                print("error",error)
                onCompletion(nil)
            }
            
        }
        
       
        
        
    }
    
    
    }
        
    
    

