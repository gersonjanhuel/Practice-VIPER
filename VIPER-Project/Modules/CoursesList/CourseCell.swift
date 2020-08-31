//
//  CourseCell.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 28/08/20.
//

import UIKit

class CourseCell: UITableViewCell {
    
    // model get exposed
    var courseViewModel: CourseViewModel! {
        didSet {
            // view only consumes prepared data, no aditional logic
            textLabel?.text = courseViewModel.name
            detailTextLabel?.text = courseViewModel.numberOfLessonsText
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // cell styling
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
