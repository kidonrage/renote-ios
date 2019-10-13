//
//  ViewController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 12.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController {
    
    private let categoriesCollectionView = CategoriesCollectionView()
    private let notesTableView = NotesTableView()
    private let addButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.backgroundColor = .backgroundYellow
        button.layer.cornerRadius = 30
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.titleEdgeInsets.bottom = 4
        button.setTitleColor(.black, for: .normal)
        
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        return button
    }()
    private let startButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = .backgroundYellow
        button.layer.cornerRadius = 30
        
        return button
    }()
    
    private var chosenCategories = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        
        categoriesCollectionView.setCategories(Category.fetchCategories())
        notesTableView.setNotes(Note.fetchNotes())
        
        setupUI()
    }
    
    @objc func addButtonTapped() {
        navigationController?.pushViewController(NoteCreationViewController(), animated: true)
    }
    
    private func setupUI() {
        view.addSubview(categoriesCollectionView)
        view.addSubview(notesTableView)
        view.addSubview(addButton)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoriesCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            categoriesCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 80),
            
            notesTableView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor),
            notesTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            notesTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            notesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            addButton.widthAnchor.constraint(equalToConstant: 60),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            addButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            
            startButton.heightAnchor.constraint(equalTo: addButton.heightAnchor),
            startButton.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            startButton.rightAnchor.constraint(equalTo: addButton.leftAnchor, constant: -10),
            startButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }


}

