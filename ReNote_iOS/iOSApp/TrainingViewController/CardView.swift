//
//  CardView.swift
//  ReNote
//
//  Created by Vlad Eliseev on 29.10.2019.
//  Copyright © 2019 Vlad Eliseev. All rights reserved.
//

import UIKit
import ReNoteKit

class CardView: UIView {
    
    let header: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "UX Glosary"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32)
        return label
    }()
    let tapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tap here to\nsee the whole text"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .darkGray
        return label
    }()
    
    var delegate: CardViewDelegate?
    let note: Note

    init(note: Note) {
        self.note = note
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        layer.cornerRadius = 10
        layer.borderColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1).cgColor
        layer.borderWidth = 2
        clipsToBounds = true
        
        setupUI()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap(gesture: UITapGestureRecognizer) {
        let detailedController = DetailedCardController(note: self.note)
        
        window?.rootViewController?.present(detailedController, animated: true, completion: nil)
    }
    
    @objc private func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: nil)
        
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        
        let rotationalTransformation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        let threshlod: CGFloat = 120
        
        let translation = gesture.translation(in: nil)
        let shouldDismissCard = abs(translation.x) > threshlod
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                let translationDirection: CGFloat = translation.x > 0 ? 1 : -1
                self.transform = CGAffineTransform(translationX: 500 * translationDirection, y: translation.y)
            } else {
                self.transform = .identity
            }
        }) { (_) in
            if shouldDismissCard {
                self.removeFromSuperview()
                self.delegate?.cardDidDismissed()
            }
        }
    }
    
    private func setupUI() {
        addSubview(header)
        addSubview(tapLabel)
        
        header.text = note.name
        
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: centerXAnchor),
            header.widthAnchor.constraint(equalTo: widthAnchor, constant: -20),
            header.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            
            tapLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            tapLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tapLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

protocol CardViewDelegate {
    func cardDidDismissed()
}
