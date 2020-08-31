//
//  CoursesListRouter.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 30/08/20.
//

import Foundation
import UIKit

class CoursesListRouter {
    func getScreen() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CoursesListViewController") as! CoursesListViewController
        
        let interactor = CoursesListInteractor()
        let presenter = CoursesListPresenter()
        presenter.interactor = interactor
        
        interactor.interactorProtocol = presenter
        presenter.presenterProtocol = vc
        vc.presenter = presenter
        
        // wrap with navigation controller
        let nc = UINavigationController(rootViewController: vc)
        
        return nc
    }
    
    func pushToDetail(courseViewModel: CourseViewModel, withNC nc: UINavigationController) {
        
        // Call Detail Router
        let detailRouter = CourseDetailRouter()
        let detailVC = detailRouter.getScreen(withCourseTitle: courseViewModel.name)
        
        nc.pushViewController(detailVC, animated: true)
        //nc.present(detailVC, animated: true, completion: nil)
    }
    
}
