//
//  TableViewController.swift
//  On The Map
//
//  Created by Michal Hus on 2/24/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit

class StudentsLocationTableViewController: UITableViewController {
    
    var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Client.getStudentsLocation { (response, error) in
            guard let response = response, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.students = response.results
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)as! StudentCellViewCell
        let student = students[indexPath.row]
        cell.configure(with: student)
        return cell
    }
}
