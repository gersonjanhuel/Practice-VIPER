//
//  CourseDetailViewController.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 30/08/20.
//

import UIKit

// lets try programmatically
class CourseDetailViewController: UIViewController {
    
    var courseTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Detail Course"
        
        let courseLabel = UILabel()
        courseLabel.translatesAutoresizingMaskIntoConstraints = false
        courseLabel.text = courseTitle
        courseLabel.textColor = .black
        
        view.addSubview(courseLabel)
        
        courseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        courseLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
