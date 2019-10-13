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
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            optionalLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            optionalLabel.leftAnchor.constraint(equalTo: header.rightAnchor, constant: 10),
        ])
    }
    
}
