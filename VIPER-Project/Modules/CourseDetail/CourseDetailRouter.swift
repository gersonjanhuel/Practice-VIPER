//
//  CourseDetailRouter.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 30/08/20.
//

import Foundation
import UIKit

class CourseDetailRouter {
    func getScreen(withCourseTitle courseTitle: String) -> UIViewController {
        
        let vc = CourseDetailViewController()
        vc.courseTitle = courseTitle
        
        
        return vc
    }
}
