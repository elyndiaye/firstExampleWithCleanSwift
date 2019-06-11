//
//  Comment.swift
//  CleanSwiftStarter
//
//  Created by David on 6/20/18.
//  Copyright © 2018 David Velarde. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
