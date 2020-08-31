//
//  ViewController.swift
//  MVC-Project
//
//  Created by Gerson Janhuel on 28/08/20.
//

import UIKit

class CoursesListViewController: UITableViewController, CoursesListPresenterProtocol {
    
    var presenter: CoursesListPresenter?
    let cellID = "cellID"
    
    var courseList: CoursesListViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Courses List"
        setupTableView()
        presenter?.fetchCoursesList()
    }
    
    private func setupTableView() {
        tableView.register(CourseCell.self, forCellReuseIdentifier: cellID)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    // Table data source delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseList?.list.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CourseCell
        cell.courseViewModel = courseList?.list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter?.openDetail(courseViewModel: courseList!.list[indexPath.row], withNC: navigationController!)
    }
    
    // MARK: CoursesListPresenterProtocol
    func didFinishGettingDataFromPresenter(data: CoursesListViewModel) {
        courseList = data
        self.tableView.reloadData()
    }
}

