//
//  NoteCreationViewController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 13.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

class NoteCreationViewController: UIViewController {
    
    var chosenCategories = [Int]()
    
    let categorySelectionView = CategorySelectionView()
    let linkInputView = LinkInputView()
    let noteTextInputs = NoteTextInputView()
    let addButton: UIButton = {
        let title = "Create"
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title.uppercased(), for: .normal)
        button.backgroundColor = .backgroundYellow
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(createNote), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categorySelectionView.categoriesList.categoriesDelegate = self

        title = "Creating a note"
        view.backgroundColor = .white
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(categorySelectionView)
        view.addSubview(linkInputView)
        view.addSubview(noteTextInputs)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            categorySelectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            categorySelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            categorySelectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            linkInputView.topAnchor.constraint(equalTo: categorySelectionView.bottomAnchor, constant: 10),
            linkInputView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            linkInputView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            noteTextInputs.topAnchor.constraint(equalTo: linkInputView.bottomAnchor, constant: 10),
            noteTextInputs.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            noteTextInputs.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 125)
        ])
    }
    
    @objc func createNote() {
        guard let name = noteTextInputs.noteNameInput.text else {return}
        guard let text = noteTextInputs.noteTextInput.text else {return}
        var attachedLink: URL? = nil
        if let linkText = linkInputView.linkInput.text {
            attachedLink = URL(string: linkText)
        }
        
        let note = Note(id: 0, associatedCategories: chosenCategories, name: name, text: text, attachedLink: attachedLink)
        print(note)
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

extension NoteCreationViewController: CategoriesCollectionViewDelegate {
    func categorySelected(id: Int) {
        chosenCategories.append(id)
        print(chosenCategories)
    }
    
    func categoryDeselected(id: Int) {
        chosenCategories = chosenCategories.filter {$0 != id}
        print(chosenCategories)
    }
}
