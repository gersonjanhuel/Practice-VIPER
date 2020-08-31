//
//  CoursesListPresenter.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 30/08/20.
//

import Foundation
import UIKit

protocol CoursesListPresenterProtocol {
    // delegates
    func didFinishGettingDataFromPresenter(data: CoursesListViewModel)
}

class CoursesListPresenter: CoursesListInteractorProtocol {
    var presenterProtocol: CoursesListPresenterProtocol?
    
    var interactor: CoursesListInteractor?
    
    // add router if you need navigation
    let router = CoursesListRouter()
    
    func fetchCoursesList() {
        interactor?.fetchCourses()
    }
    
    func didFinishFetchData(data: CoursesListViewModel) {
        presenterProtocol?.didFinishGettingDataFromPresenter(data: data)
    }
    
    func openDetail(courseViewModel: CourseViewModel, withNC nc: UINavigationController) {
        router.pushToDetail(courseViewModel: courseViewModel, withNC: nc)
    }
    
}
