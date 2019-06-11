//
//  Post.swift
//  CleanSwiftStarter
//
//  Created by David on 6/20/18.
//  Copyright © 2018 David Velarde. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
