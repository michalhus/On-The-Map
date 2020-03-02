//
//  StudentCellViewCell.swift
//  On The Map
//
//  Created by Michal Hus on 2/24/20.
//  Copyright © 2020 Michal Hus. All rights reserved.
//

import UIKit

class StudentViewCell: UITableViewCell {
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentLink: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        studentName.text = ""
        studentLink.text = ""
    }
    
    func configure(with student: Student) {
        studentName.text = student.firstName + " " + student.lastName
        studentLink.text = student.mediaURL
    }
}
