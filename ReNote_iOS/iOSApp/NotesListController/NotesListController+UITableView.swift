//
//  NotesListViewController+UITableView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 20.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNoteUIKit

extension NotesListController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotesTableViewCell.reuseId, for: indexPath) as! NotesTableViewCell
        
        let cellColor: UIColor = indexPath.row % 2 == 0 ? .white : Color.noteGray
        
        let note = notes[indexPath.row]
        
        cell.title.text = note.name
        cell.categoryTitle.text = "TESTING"
        cell.noteText.text = note.text
        cell.backgroundColor = cellColor
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
