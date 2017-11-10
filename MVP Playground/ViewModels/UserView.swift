//
//  UserView.swift
//  MVP Playground
//
//  Created by Martin Otyeka on 2017-11-08.
//  Copyright © 2017 Flex Messaging Inc. All rights reserved.
//

import Foundation

protocol UserView: NSObjectProtocol {
    
    func startLoading()
    func finishLoading()
    func set(_ users: [UserViewData])
    func setEmptyUsers()
}
