//
//  StartTrainingViewController.swift
//  ReNote
//
//  Created by Vlad Eliseev on 14.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Start Training"

        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(tempTitle)
        
        NSLayoutConstraint.activate([
            tempTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tempTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tempTitle.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            tempTitle.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            tempTitle.heightAnchor.constraint(equalToConstant: 200)
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
