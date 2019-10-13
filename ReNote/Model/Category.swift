//
//  Category.swift
//  ReNote
//
//  Created by Vlad Eliseev on 12.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import Foundation

struct Category {
    let id: Int
    let name: String
    
    static func fetchCategories() -> [Category] {
        return ([
            Category(id: 0, name: "Design"),
            Category(id: 1, name: "Programming"),
            Category(id: 2, name: "Chemistry"),
            Category(id: 3, name: "Math"),
            Category(id: 4, name: "Physics"),
        ])
    }
}

