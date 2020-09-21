//
//  TrainingModeSelectionView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 28.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNoteUIKit

class TrainingModeSelectionView: UIView {
    
    let header = SectionHeaderLabel(text: "Mode")
    
    let trainingModeSegmentedControl: UISegmentedControl = {
        let types = [
            TrainingMode.exam.rawValue,
            TrainingMode.wholeNote.rawValue
        ]
        let sc = UISegmentedControl(items: types)
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(header)
        addSubview(trainingModeSegmentedControl)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 64),
            
            header.topAnchor.constraint(equalTo: topAnchor),
            header.leftAnchor.constraint(equalTo: leftAnchor),
            
            
            trainingModeSegmentedControl.topAnchor.constraint(equalTo: header.bottomAnchor),
        trainingModeSegmentedControl.heightAnchor.constraint(equalToConstant: 34),
            trainingModeSegmentedControl.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            trainingModeSegmentedControl.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            trainingModeSegmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
