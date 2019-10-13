//
//  NoteCreationViewController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class NoteCreationViewController: UIViewController {
    
    let categorySelectionView = CategorySelectionView()
    let linkInputView = LinkInputView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Creating a note"
        view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(categorySelectionView)
        view.addSubview(linkInputView)
        
        NSLayoutConstraint.activate([
            categorySelectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            categorySelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            categorySelectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            linkInputView.topAnchor.constraint(equalTo: categorySelectionView.bottomAnchor, constant: 10),
            linkInputView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            linkInputView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
