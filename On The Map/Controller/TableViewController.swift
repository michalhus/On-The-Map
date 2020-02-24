//
//  TableViewController.swift
//  On The Map
//
//  Created by Michal Hus on 2/24/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)as! StudentCellViewCell
     
        let studentInfo = Client.getStudentsLocation

        
//        let meme = self.memes[(indexPath as NSIndexPath).row]

        
        return cell
    }
    
}
