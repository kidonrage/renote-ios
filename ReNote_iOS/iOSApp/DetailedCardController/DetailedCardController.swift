//
//  DetailedCardController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 30.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNoteKit

class DetailedCardController: UIViewController {
    
    let noteHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 26, weight: .medium)
        return label
    }()
    let linkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    let noteTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 20, weight: .light)
        textView.isEditable = false
        textView.contentInset = .zero
        return textView
    }()
    
    let note: Note

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
    }
    
    init(note: Note) {
        self.note = note
        super.init(nibName: nil, bundle: nil)
    }
    
    private func setupUI() {
        additionalSafeAreaInsets = UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12)
        
        view.addSubview(noteHeader)
        var noteTopAnchor = noteHeader.bottomAnchor
        if let link = note.attachedLink {
            view.addSubview(linkLabel)
            noteTopAnchor = linkLabel.bottomAnchor
            linkLabel.text = link
            NSLayoutConstraint.activate([
                linkLabel.topAnchor.constraint(equalTo: noteHeader.bottomAnchor, constant: 5),
                linkLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                linkLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
            ])
        }
        view.addSubview(noteTextView)
        
        noteHeader.text = note.name
        noteTextView.text = note.text
        
        NSLayoutConstraint.activate([
            noteHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteHeader.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            noteHeader.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            noteTextView.topAnchor.constraint(equalTo: noteTopAnchor),
            noteTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: -4),
            noteTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            noteTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}
