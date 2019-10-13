//
//  LinkInputView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class LinkInputView: UIView {
    
    let header = SectionHeaderLabel(text: "Link")
    
    let optionalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10)
        label.text = "(optional)"
        return label
    }()
    
    let linkInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Enter a link..."
        input.autocapitalizationType = .none
        return input
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
        addSubview(optionalLabel)
        addSubview(linkInput)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            optionalLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            optionalLabel.leftAnchor.constraint(equalTo: header.rightAnchor, constant: 10),
            
            linkInput.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            linkInput.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            linkInput.rightAnchor.constraint(equalTo: rightAnchor, constant:  -10),
            linkInput.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
