//
//  TrainingViewController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 28.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNoteKit

class TrainingController: UIViewController {
    
    let topBar = UIView()
    let cardDeckView = UIView()
    let bottomBar = UIView()
    let stopButton: UIButton = {
        let button = UIButton()
        button.setTitle("Stop", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.black, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var trainingNotes = [Note]()
    var remainingCards = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .white
        
        setupUI()
        setupCards()
    }
    
    private func setupCards() {
        // TODO: implement
        
//        let storage = Storage()
//        let notes = storage.getNotes()
//        self.trainingNotes = notes
//        self.remainingCards = notes.count
//
//        for note in trainingNotes {
//            let cardView = CardView(note: note)
//            cardView.delegate = self
//            cardDeckView.addSubview(cardView)
//            cardView.fillSuperview()
//        }
    }
    
//    init(trainingNotes: [Note]?) {
//        self.trainingNotes = trainingNotes
//
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func setupUI() {
        bottomBar.addSubview(stopButton)
        
        let stackView = UIStackView(arrangedSubviews: [topBar, cardDeckView, bottomBar])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        stackView.bringSubviewToFront(cardDeckView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            topBar.heightAnchor.constraint(equalToConstant: 50),
            bottomBar.heightAnchor.constraint(equalToConstant: 75),
            stopButton.centerYAnchor.constraint(equalTo: bottomBar.centerYAnchor),
            stopButton.leftAnchor.constraint(equalTo: bottomBar.leftAnchor, constant: 10),
        ])
        
    }
    
    @objc func stopButtonTapped() {
        returnToNotesList()
    }
    
    private func outOfCardsHandler() {
        let ac = UIAlertController(title: "All cards are done!", message: "Krasava!", preferredStyle: .alert)
        ac.addAction(
            UIAlertAction(title: "OK!", style: .default, handler: { (action) in
                self.returnToNotesList()
            })
        )
        self.present(ac, animated: true, completion: nil)
    }
    
    private func returnToNotesList() {
        navigationController?.popToRootViewController(animated: true)
    }

}

extension TrainingController: CardViewDelegate {
    func cardDidDismissed() {
        remainingCards -= 1
        if remainingCards < 1 {
            outOfCardsHandler()
        }
    }
}
