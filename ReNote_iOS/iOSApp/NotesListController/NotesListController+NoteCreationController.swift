//
//  NotesListController+NoteCreationController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 20.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNoteKit

extension NotesListController: NoteCreationControllerDelegate {
    func didAddCategory(_ category: NoteCategory) {
        categoriesCollectionView.addCategory(category)
    }
    
    func didAddNote(_ note: Note) {
        notes.insert(note, at: 0)
        
        let insertionIndexPath = IndexPath(row: 0, section: 0)
        
        notesTableView.insertRows(at: [insertionIndexPath], with: .left)
    }
}
