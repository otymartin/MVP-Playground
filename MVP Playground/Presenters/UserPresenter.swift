//
//  UserPresenter.swift
//  MVP Playground
//
//  Created by Martin Otyeka on 2017-11-08.
//  Copyright © 2017 Flex Messaging Inc. All rights reserved.
//

class UserPresenter {
    
    private let userService: UserService
    
    private weak var userView: UserView?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func attach(_ view: UserView) {
        self.userView = view
    }
    
    func getUsers() {
        self.userView?.startLoading()
        self.userService.getUsers { [weak self] (users) in
            self?.userView?.finishLoading()
            if users.count == 0 {
                self?.userView?.setEmptyUsers()
            } else {
                let mappedUsers = users.map {
                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.userView?.set(mappedUsers)
            }
        }
    }
}
