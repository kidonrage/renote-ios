//
//  NoteTextInputView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class NoteTextInputView: UIView {
    
    let header = SectionHeaderLabel(text: "Note")
    
    let noteNameInput: UITextFieldLimited = {
        let input = UITextFieldLimited(maxLength: 60)
        input.translatesAutoresizingMaskIntoConstraints = false
        input.font = .systemFont(ofSize: 30)
        input.placeholder = "Title"
        return input
    }()
    
    let noteTextInput: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = .systemFont(ofSize: 18)
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(header)
        addSubview(noteNameInput)
        addSubview(noteTextInput)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            noteNameInput.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            noteNameInput.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            noteNameInput.rightAnchor.constraint(equalTo: rightAnchor, constant:  -10),
            
            noteTextInput.topAnchor.constraint(equalTo: noteNameInput.bottomAnchor, constant: 10),
            noteTextInput.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            noteTextInput.rightAnchor.constraint(equalTo: rightAnchor, constant:  -10),
            noteTextInput.heightAnchor.constraint(equalToConstant: 200),
            noteTextInput.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
