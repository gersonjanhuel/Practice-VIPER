//
//  CoursesListInteractor.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 30/08/20.
//

import Foundation

// view model that presenter will need
struct CoursesListViewModel {
    var list: [CourseViewModel]
}

struct CourseViewModel {
    let name: String
    let numberOfLessonsText: String
    
    init(course: Course) {
        name = course.name
        
        // some model logic here
        if course.number_of_lessons > 35 {
            numberOfLessonsText = "Number of lesson 35+"
        } else {
            numberOfLessonsText = "Number of lesson \(course.number_of_lessons)"
        }
    }
}

protocol CoursesListInteractorProtocol {
    func didFinishFetchData(data: CoursesListViewModel)
}

class CoursesListInteractor {
    var interactorProtocol: CoursesListInteractorProtocol?
    
    func fetchCourses() {
        //call service here
        Service.shared.fetchCourses { (courses, error) in
            if let err = error {
                print("Failed to fetch Courses \(err)")
                return
            }
            
            var coursesListViewModel = CoursesListViewModel(list: [])
            
            if let courses = courses {
                let coursesViewModel: [CourseViewModel] = courses.map({ .init(course: $0) })
                coursesListViewModel.list = coursesViewModel
            }

            self.interactorProtocol?.didFinishFetchData(data: coursesListViewModel)
        }
    }
}
