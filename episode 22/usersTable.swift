//
//  usersTable.swift
//  episode 22
//
//  Created by apple on 28/08/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class usersTable: UITableView,UITableViewDataSource,UITableViewDelegate {
    
    var dataSourceArray  =   [user](){
        didSet{
            reloadData()
        }
        
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate=self
        self.dataSource=self
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSourceArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:userCell   =   tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath) as! userCell
        
        let myUser  =   self.dataSourceArray[indexPath.row]
        
        cell.name.text  =   myUser.name
        cell.userName.text  =   myUser.username
        cell.email.text =   myUser.email
        cell.phone.text =  myUser.phone
        cell.companyName.text   =   myUser.company?.companyName
        cell.phrase.text =   myUser.company?.phrase
        cell.address.text    =   myUser.address?.street
        
        
        
        return cell
        
    }




}
