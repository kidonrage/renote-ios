//
//  ViewController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 12.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNote_Core

class NotesListController: UIViewController {
    
    let storage = Storage()
    var notes = [Note]()
    var selectedCategories = [Int]() {
        didSet {
            filterNotesByCategories(selectedCategories)
        }
    }
    
    let categoriesCollectionView = CategoriesCollectionView()
    let notesTableView = NotesTableView()
    let addButton: UIButton = {
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
    let startButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = .backgroundYellow
        button.layer.cornerRadius = 30
        
        button.addTarget(self, action: #selector(startTrainingButtonTapped), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Notes"
        view.backgroundColor = .white
        
        categoriesCollectionView.categoriesDelegate = self
        categoriesCollectionView.setCategories(storage.getCategories())
        categoriesCollectionView.selectCategory(at: IndexPath(row: 0, section: 0))
        
        notesTableView.delegate = self
        notesTableView.dataSource = self
        
        setupUI()
    }
    
    @objc func addButtonTapped() {
        let noteCreationController = NoteCreationViewController()
        noteCreationController.delegate = self
        
//        let navController = UINavigationController(rootViewController: noteCreationController)
        
        present(noteCreationController, animated: true, completion: nil)
    }
    
    @objc func startTrainingButtonTapped() {
        navigationController?.pushViewController(StartTrainingViewController(), animated: true)
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
    
    func filterNotesByCategories(_ categories: [Int]) {
        print(categories)
        var filteredNotes = [Note]()
        
        if categories.contains(-1) {
            filteredNotes = storage.getNotes()
        } else {
            let longCategories = categories.map { category in KotlinLong(value: Int64(category))}
            filteredNotes = storage.getNotesForCategories(categoriesIds: longCategories)
        }
        
        notes = filteredNotes
        notesTableView.reloadData()
    }

}
