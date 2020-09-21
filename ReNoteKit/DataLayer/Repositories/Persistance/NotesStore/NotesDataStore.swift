//
//  NotesDataStore.swift
//  ReNoteKit
//
//  Created by Vlad Eliseev on 22.09.2020.
//  Copyright © 2020 Vlad Eliseev. All rights reserved.
//

import Foundation

public protocol NotesDataStore {

    func addCategory(name: String) -> NoteCategory
    func getCategories() -> [NoteCategory]
    func getNotes() -> [Note]
    func getNotesForCategory(id: Int) -> [Note]
    func getNotesForCategories(categoriesIds: [Int]) -> [Note]
    func getRandomNotesForCategories(categoriesIds: [Int]) -> [Note]
    func addNote(name: String, text: String, attachedLink: String?, attachedCategories: [Int]) -> Note

}
