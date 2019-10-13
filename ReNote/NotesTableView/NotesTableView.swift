//
//  NotesTableView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class NotesTableView: UITableView{
    
    var notes = [Note]()

    init() {
        super.init(frame: .zero, style: .plain)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        register(NotesTableViewCell.self, forCellReuseIdentifier: NotesTableViewCell.reuseId)
        
        dataSource = self
        delegate = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNotes(_ notes: [Note]) {
        self.notes = notes
        reloadData()
    }
}

extension NotesTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: NotesTableViewCell.reuseId, for: indexPath) as! NotesTableViewCell
        
        let cellColor: UIColor = indexPath.row % 2 == 0 ? .white : .noteGray
        
        let note = notes[indexPath.row]
        
        cell.title.text = note.name
        cell.categoryTitle.text = "TESTING"
        cell.noteText.text = note.text
        cell.backgroundColor = cellColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
