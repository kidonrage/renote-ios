//
//  NotesListController+CategoriesCollectionView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 20.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

extension NotesListController: CategoriesCollectionViewDelegate {
    func categorySelected(id: Int) {
        selectedCategories.append(id)
    }
    
    func categoryDeselected(id: Int) {
        selectedCategories = selectedCategories.filter {$0 != id}
    }
}
