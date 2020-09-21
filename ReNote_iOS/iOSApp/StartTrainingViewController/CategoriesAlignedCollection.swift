//
//  CategoriesSelectionView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 28.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNoteUIKit

class CategoriesAlignedCollection: CategoriesCollectionView {

    override init() {
        super.init()
        
        let layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .center)
        self.collectionViewLayout = layout
        self.contentInset = UIEdgeInsets.zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = categories[indexPath.row].name.size(withAttributes: nil)
        
        return CGSize(width: cellWidth.width + 45, height: 50 )
    }
    
}
