//
//  UserViewController.swift
//  MVP Playground
//
//  Created by Martin Otyeka on 2017-11-08.
//  Copyright © 2017 Flex Messaging Inc. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView!
    var tableView: UITableView!
    
    private let userPresenter = UserPresenter(userService: UserService())
    private var usersToDisplay = [UserViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicatorConfiguration()
        self.tableViewConfiguration()
        
        self.tableView.dataSource = self
        self.activityIndicator.hidesWhenStopped = true
        
        self.userPresenter.attach(self)
        self.userPresenter.getUsers()
    }
    
}

extension UserViewController: UserView {
    
    func startLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func finishLoading() {
        self.activityIndicator.stopAnimating()
    }
    
    func set(_ users: [UserViewData]) {
        self.usersToDisplay = users
        self.tableView.reloadData()
    }
    
    func setEmptyUsers() {
    }
}

extension UserViewController: UITableViewDataSource {
    
    func activityIndicatorConfiguration() {
        self.activityIndicator = UIActivityIndicatorView(frame: CGRect(x: self.view.bounds.width - 50, y: 20, width: 0, height: 0))
        self.view.addSubview(self.activityIndicator)
    }
    
    func tableViewConfiguration() {
        self.tableView = UITableView()
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UserCell")
        let userViewData = self.usersToDisplay[indexPath.row]
        cell.textLabel?.text = userViewData.name
        cell.detailTextLabel?.text = userViewData.age
        return cell
    }
    
}




