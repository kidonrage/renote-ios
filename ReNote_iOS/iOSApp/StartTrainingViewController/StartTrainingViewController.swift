//
//  StartTrainingViewController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 14.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNoteKit
import ReNoteUIKit

enum TrainingMode: String {
    case exam = "Exam"
    case wholeNote = "Whole Note"
}

class StartTrainingViewController: UIViewController {
    
    let tempTitle: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Скоро здесь будет экран. А пока пей кофе и работай"
        textView.isEditable = false
        textView.textColor = .black
        textView.textAlignment = .center
        textView.font = .boldSystemFont(ofSize: 18)
        return textView
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = 38
        button.backgroundColor = Color.backgroundYellow
        button.addTarget(self, action: #selector(startTraining), for: .touchUpInside)
        return button
    }()
    
    let trainingModeSelectionView = TrainingModeSelectionView()
    
    let categoriesSelectionHeader = SectionHeaderLabel(text: "Category")
    let categoriesSelectionCollection = CategoriesAlignedCollection()
    
    let storage: NotesDataStore? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Start Training"
        
        categoriesSelectionCollection.setCategories(storage?.getCategories() ?? [])
        categoriesSelectionCollection.selectCategory(at: IndexPath(row: 0, section: 0))

        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(trainingModeSelectionView)
        view.addSubview(categoriesSelectionHeader)
        view.addSubview(categoriesSelectionCollection)
        view.addSubview(startButton)
        
        additionalSafeAreaInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 76),
            startButton.widthAnchor.constraint(equalToConstant: 76),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            trainingModeSelectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            trainingModeSelectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            trainingModeSelectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            categoriesSelectionHeader.topAnchor.constraint(equalTo: trainingModeSelectionView.bottomAnchor, constant: 12),
            categoriesSelectionHeader.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            categoriesSelectionHeader.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            categoriesSelectionCollection.topAnchor.constraint(equalTo: categoriesSelectionHeader.bottomAnchor),
            categoriesSelectionCollection.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -12),
            categoriesSelectionCollection.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            categoriesSelectionCollection.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    @objc func startTraining() {
        let selectedCategories = categoriesSelectionCollection.selectedCategories
        guard selectedCategories.count > 0 else {
            presentAlertNotification(title: "There are no chosen categories!", message: nil)
            return
        }
        
        let modeSegmentedControl = trainingModeSelectionView.trainingModeSegmentedControl
        guard
            let selectedModeTitle = modeSegmentedControl.titleForSegment(at: modeSegmentedControl.selectedSegmentIndex),
            let selectedMode = TrainingMode(rawValue: selectedModeTitle)
        else { return }
        
        let selectedCategoriesIds = selectedCategories.map { category in category.id }
        
        // TODO: Conditional training based on chosen mode
        
        let notes = selectedCategoriesIds.contains(-1)
            ? storage?.getNotes() ?? []
            : storage?.getRandomNotesForCategories(categoriesIds: selectedCategoriesIds) ?? []
        
        guard notes.count > 0 else {
            presentAlertNotification(title: "There are no notes!", message: "There are 0 notes in the categories you've chosen")
            return
        }
        
//        let trainingController = TrainingViewController(trainingNotes: notes)
        let trainingController = TrainingController()
        navigationController?.pushViewController(trainingController, animated: true)
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
