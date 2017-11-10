//
//  UserService.swift
//  MVP Playground
//
//  Created by Martin Otyeka on 2017-11-08.
//  Copyright © 2017 Flex Messaging Inc. All rights reserved.
//

import Foundation

class UserService {
    
    func getUsers(callback: @escaping ([User]) -> Void) {
        let users = [User(firstName: "Martin", lastName: "Otyeka", email: "martin@gmail.com", age: 27),
                     User(firstName: "Maria", lastName: "Otyeka", email: "maria@gmail.com", age: 28),
                     User(firstName: "Peter", lastName: "Otyeka", email: "peter@gmail.com", age: 24),
                     User(firstName: "Mathew", lastName: "Otyeka", email: "mathew@gmail.com", age: 21)
        ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            callback(users)
        }
    }
}
