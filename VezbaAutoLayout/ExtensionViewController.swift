//
//  Extension.swift
//  VezbaAutoLayout
//
//  Created by Nikola on 17/01/2020.
//  Copyright © 2020 Nikola Krstevski. All rights reserved.
//

import UIKit

extension ViewController {
    
    func makeButton(title: String, action: Selector, backgroundColor: UIColor, titleColor: UIColor? = .black) -> UIButton {
        let button = UIButton()
        // Customise the button with your settings
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.layer.cornerRadius = 5
        // Return the newly created button
        return button
    }
    
    @objc func buttonTapped(sender: UIButton) {
        if sender.tag == 0 {
            print("Upper Button tapped")
        } else if sender.tag == 1 {
            print("Lower Button tapped")
        }
    }
    
    func createViewContainer(backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
    
    func layoutSetup() {
        
        let upperButton = makeButton(title: "UpButton", action: #selector(buttonTapped), backgroundColor: .yellow)
        upperButton.tag = 0
        let lowerButton = makeButton(title: "LwButton", action: #selector(buttonTapped), backgroundColor: .yellow)
        lowerButton.tag = 1
        let blueCont = createViewContainer(backgroundColor: .blue)
        let redCont = createViewContainer(backgroundColor: .red)
        
        [redCont, blueCont, upperButton, lowerButton].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        [redCont, blueCont].forEach{view.addSubview($0)}
        redCont.addSubview(upperButton)
        blueCont.addSubview(lowerButton)
        
        
        NSLayoutConstraint.activate([
            redCont.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            redCont.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            redCont.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            blueCont.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            blueCont.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blueCont.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueCont.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            upperButton.widthAnchor.constraint(equalToConstant: 85),
            upperButton.heightAnchor.constraint(equalToConstant: 46),
            upperButton.centerXAnchor.constraint(equalTo: redCont.centerXAnchor),
            upperButton.centerYAnchor.constraint(equalTo: redCont.centerYAnchor),
            
            lowerButton.widthAnchor.constraint(equalToConstant: 85),
            lowerButton.heightAnchor.constraint(equalToConstant: 46),
            lowerButton.centerXAnchor.constraint(equalTo: blueCont.centerXAnchor),
            lowerButton.centerYAnchor.constraint(equalTo: blueCont.centerYAnchor)
            
        ])
    }
}
