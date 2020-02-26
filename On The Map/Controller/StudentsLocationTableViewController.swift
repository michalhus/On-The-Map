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
    
    @IBAction func refreshStudentsLocation(_ sender: Any) {
        Client.getStudentsLocation { (response, error) in
            guard let response = response, error == nil else {
                return
            }
            self.refetchLocations(response: response)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)as! StudentViewCell
        let student = students[indexPath.row]
        cell.configure(with: student)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = students[indexPath.row]
        let studentURL = URL(string: student.mediaURL)!
        UIApplication.shared.open(studentURL, options: [:], completionHandler: nil)
    }
    
    func refetchLocations(response: StudentsLocationResponse) {
        DispatchQueue.main.async {
            self.students = response.results
            self.tableView.reloadData()
        }
    }
}
