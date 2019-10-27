//
//  CategoryCollectionViewCell.swift
//  ReNote
//
//  Created by Vlad Eliseev on 12.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "Category"
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? UIColor(red: 255 / 255.0, green: 216 / 255.0, blue: 87 / 255.0, alpha: 1) : UIColor(red: 255 / 255.0, green: 216 / 255.0, blue: 87 / 255.0, alpha: 0.32)
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        layer.cornerRadius = 10
        
        isSelected = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setHighlighted(_ isHighlighted: Bool) {
//        if isHighlighted {
//            self.backgroundColor = UIColor(red: 255 / 255.0, green: 216 / 255.0, blue: 87 / 255.0, alpha: 1)
//        } else {
//            self.backgroundColor = UIColor(red: 255 / 255.0, green: 216 / 255.0, blue: 87 / 255.0, alpha: 0.32)
//        }
//    }
    
}
