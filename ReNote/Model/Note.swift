//
//  Note.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import Foundation

struct Note {
    let id: Int
    let associatedCategories: [Int]
    let name: String
    let text: String
    let attachedLink: URL?
    
    static func fetchNotes() -> [Note] {
        var notes = [Note]()
        
        for i in 0...4 {
            notes.append(
                Note(id: i, associatedCategories: [i], name: "TESTING\(i)", text: "TESTINGTESSTINGTESTING\(i)", attachedLink: URL(string: "http://vk.com") ?? nil)
            )
        }
        return notes
    }
}
