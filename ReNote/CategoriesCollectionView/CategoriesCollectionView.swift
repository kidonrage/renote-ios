//
//  CategoriesCollectionView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 12.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNote_Core

class CategoriesCollectionView: UICollectionView {
    
    var categoriesDelegate: CategoriesCollectionViewDelegate?
    
    var categories = [ReNote_Core.Category]()
    var selectedCategories = [ReNote_Core.Category]()
    
    var withAllCategory: Bool = true

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        allowsMultipleSelection = true
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
            selectCategory(at: indexPath)
        }
    }
    
    func selectCategory(at indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        if let index = selectedCategories.firstIndex(of: category) {
            selectedCategories.remove(at: index)
            deselectItem(at: indexPath, animated: true)
            categoriesDelegate?.categoryDeselected(id: Int(category.id))
        } else {
            selectedCategories.append(category)
            selectItem(at: indexPath, animated: true, scrollPosition: .left)
            categoriesDelegate?.categorySelected(id: Int(category.id))
        }
    }
    
    func setCategories(_ categories: [ReNote_Core.Category]) {
        var newcategories = categories
        
        if withAllCategory {
            newcategories.insert(ReNote_Core.Category(id: -1, name: "All"), at: 0)
        }
        
        self.categories = newcategories
        
        reloadData()
    }
    
    func addCategory(_ category: ReNote_Core.Category, needsToBeSelected: Bool = false) {
        let indexPath = IndexPath(row: categories.count, section: 0)
        performBatchUpdates({
            self.categories.append(category)
            insertItems(at: [indexPath])
        }, completion: { completed in
            if (needsToBeSelected) {
                self.selectCategory(at: indexPath)
            }
        })
    }
    
}

extension CategoriesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return categories.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryData = categories[indexPath.row]
        let cell = dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseId, for: indexPath) as! CategoryCollectionViewCell
        cell.nameLabel.text = categoryData.name
//        cell.setHighlighted(cellData.isActive)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = categories[indexPath.row].name.size(withAttributes: nil)
        
        return CGSize(width: cellWidth.width + 80, height: frame.height - 20 )
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Select item at \(indexPath)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Deselect item at \(indexPath)")
    }
    
}

protocol CategoriesCollectionViewDelegate {
    func categorySelected(id: Int)
    func categoryDeselected(id: Int)
}
