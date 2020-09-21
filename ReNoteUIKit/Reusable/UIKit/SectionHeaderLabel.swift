//
//  SectionHeaderLabel.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

public class SectionHeaderLabel: UILabel {

    public init(text: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.font = .monospacedDigitSystemFont(ofSize: 12, weight: .black)
        self.text = text.uppercased()
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
