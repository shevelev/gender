//
//  ViewController.swift
//  gender
//
//  Created by Сергей Шевелев on 16.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: StackViews
    private let stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [])
        stack.axis  = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        return stack
    }()
    

    
    lazy var manButton: CustomButtonChoose = {
        let button = CustomButtonChoose(_title: "Мужчина", _image: "man", _color:  "manColor")
        button.addTarget(self, action: #selector(genderPressed(_:)), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    lazy var womanButton: CustomButtonChoose = {
        let button = CustomButtonChoose(_title: "Женщина", _image: "woman", _color: "womanColor")
        button.addTarget(self, action: #selector(genderPressed(_:)), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    lazy var favoriteButton: CustomButtonChoose = {
        let button = CustomButtonChoose(_title: "Избранное", _image: "Star1", _color: "favorColor")
        button.addTarget(self, action: #selector(genderPressed(_:)), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    lazy var boyButton: CustomButtonChoose = {
        let button = CustomButtonChoose(_title: "Мальчик", _image: "man", _color: "boyColor")
        button.addTarget(self, action: #selector(genderPressed(_:)), for: .touchUpInside)
        button.tag = 4
        return button
    }()
    
    lazy var girlButton: CustomButtonChoose = {
        let button = CustomButtonChoose(_title: "Девочка", _image: "woman", _color: "girlColor")
        button.addTarget(self, action: #selector(genderPressed(_:)), for: .touchUpInside)
        button.tag = 5
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(manButton)
        stackView.addArrangedSubview(womanButton)
        view.addSubview(favoriteButton)
        view.addSubview(boyButton)
        view.addSubview(girlButton)
        
        setConstraintsStack()
        
    }
    
    
    
    @objc func genderPressed(_ sender: UIButton!) {
        print(sender.tag)
        if sender.tag == 1 {
            manButton.show(false)
            womanButton.show(true)
            favoriteButton.show(true)
            boyButton.show(true)
            girlButton.show(true)

        } else if sender.tag == 2 {
            manButton.show(true)
            womanButton.show(false)
            favoriteButton.show(true)
            boyButton.show(true)
            girlButton.show(true)
        } else if sender.tag == 3 {
            manButton.show(true)
            womanButton.show(true)
            favoriteButton.show(false)
            boyButton.show(true)
            girlButton.show(true)
        } else if sender.tag == 4 {
           manButton.show(true)
           womanButton.show(true)
           favoriteButton.show(true)
           boyButton.show(false)
           girlButton.show(true)
       } else if sender.tag == 5 {
           manButton.show(true)
           womanButton.show(true)
           favoriteButton.show(true)
           boyButton.show(true)
           girlButton.show(false)
       }
    }
    
    private func setConstraintsStack() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
     
            manButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2) - 2),
            manButton.heightAnchor.constraint(equalToConstant: 46),
            womanButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2) - 2),
            womanButton.heightAnchor.constraint(equalToConstant: 46),
            favoriteButton.heightAnchor.constraint(equalToConstant: 46),
            favoriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            favoriteButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            
            boyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            boyButton.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 16),
            boyButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 4) * 3),
            boyButton.heightAnchor.constraint(equalToConstant: 46),
            
            girlButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            girlButton.topAnchor.constraint(equalTo: boyButton.bottomAnchor, constant: 16),
            girlButton.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            girlButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
}
