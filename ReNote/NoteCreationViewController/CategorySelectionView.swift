//
//  CategorySelectionView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNote_Core

class CategorySelectionView: UIView {
    
    let storage = Storage()
    
    var delegate: CategorySelectionViewDelegate?
    
    var parentController: UIViewController?
    let header = SectionHeaderLabel(text: "Category")
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+ Add new", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(addCategory), for: .touchUpInside)
        return button
    }()
    
    let categoriesList = CategoriesCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        categoriesList.withAllCategory = false
        categoriesList.setCategories(storage.getCategories())
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addCategory() {
        let ac = UIAlertController(title: "Add Category", message: "Please enter a category name:", preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = "Category Name"
        }
        ac.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action) in
            guard let nameTextField = ac.textFields?[0] else {return}
            guard let name = nameTextField.text, name != "" else {return}
            
            let newCategory = self.storage.addCategory(name: name)
            
            self.categoriesList.addCategory(newCategory, needsToBeSelected: true)
            
            self.delegate?.didAddCategory(newCategory)
        }))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        parentController?.present(ac, animated: true, completion: nil)
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

protocol CategorySelectionViewDelegate {
    func didAddCategory(_ category: ReNote_Core.Category)
}
