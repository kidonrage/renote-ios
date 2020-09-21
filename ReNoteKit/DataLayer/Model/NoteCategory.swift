//
//  Category.swift
//  ReNoteKit
//
//  Created by Vlad Eliseev on 22.09.2020.
//  Copyright © 2020 Vlad Eliseev. All rights reserved.
//

public struct NoteCategory: Equatable {
    public let id: Int
    public let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
