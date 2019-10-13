//
//  CategorySelectionView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class CategorySelectionView: UIView {
    
    let header = SectionHeaderLabel(text: "Category")
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+ Add new", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    let categoriesList = CategoriesCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        categoriesList.setCategories(Category.fetchCategories())
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(header)
        addSubview(addButton)
        addSubview(categoriesList)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            addButton.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            addButton.leftAnchor.constraint(equalTo: header.rightAnchor, constant: 10),
            
            categoriesList.leftAnchor.constraint(equalTo: leftAnchor),
            categoriesList.rightAnchor.constraint(equalTo: rightAnchor),
            categoriesList.topAnchor.constraint(equalTo: addButton.bottomAnchor),
            categoriesList.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

}
