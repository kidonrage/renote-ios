//
//  CategoriesCollectionView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 12.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class CategoriesCollectionView: UICollectionView {
    
    var categoriesDelegate: CategoriesCollectionViewDelegate?
    
    var cells = [CategoryCellModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        backgroundColor = .white
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        if let indexPath = self.indexPathForItem(at: sender.location(in: self)) {
            let cell = self.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            cells[indexPath.row].isActive = !cells[indexPath.row].isActive
            cell.setHighlighted(cells[indexPath.row].isActive)
            
            if let delegate = self.categoriesDelegate {
                let categoryId = cells[indexPath.row].category.id
                if cells[indexPath.row].isActive {
                    delegate.categorySelected(id: categoryId)
                } else {
                    delegate.categoryDeselected(id: categoryId)
                }
            }
        }
    }

    
    func setCategories(_ categories: [Category]) {
        for category in categories {
            cells.append(CategoryCellModel(category: category, isActive: false))
        }
    }
    
}

extension CategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return cells.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellData = cells[indexPath.row]
        let cell = dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
        cell.nameLabel.text = cellData.category.name
        cell.setHighlighted(cellData.isActive)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = cells[indexPath.row].category.name.size(withAttributes: nil)
        
        return CGSize(width: cellWidth.width + 80, height: frame.height - 20 )
    }
    
}

protocol CategoriesCollectionViewDelegate {
    func categorySelected(id: Int)
    func categoryDeselected(id: Int)
}
