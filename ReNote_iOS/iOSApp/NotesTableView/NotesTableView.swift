//
//  NotesTableView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class NotesTableView: UITableView{

    init() {
        super.init(frame: .zero, style: .plain)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        register(NotesTableViewCell.self, forCellReuseIdentifier: NotesTableViewCell.reuseId)
        
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
