//
//  NotesTableViewCell.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class NotesTableViewCell: UITableViewCell {
    
    static let reuseId = "Note"
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()
    let categoryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.numberOfLines = 2
        label.textColor = UIColor.black.withAlphaComponent(0.2)
        return label
    }()
    let noteText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(title)
        contentView.addSubview(categoryTitle)
        contentView.addSubview(noteText)
        
        contentView.layoutMargins = UIEdgeInsets(top: 13, left: 20, bottom: 13, right: 20)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            title.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: (contentView.frame.size.width * -1) / 3 - contentView.layoutMargins.right),
            
            categoryTitle.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor),
            categoryTitle.leftAnchor.constraint(equalTo: title.rightAnchor),
            categoryTitle.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            
            noteText.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            noteText.leftAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leftAnchor),
            noteText.rightAnchor.constraint(equalTo: contentView.layoutMarginsGuide.rightAnchor),
            noteText.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
