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
    
    lazy var manButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitleColor( UIColor(named: "manColor"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Мужчина", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 23
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "manColor")?.cgColor
        button.tag = 1
        button.addTarget(self, action: #selector(genderPressed(_:)), for: .touchUpInside) //test
        return button
    }()
    
    lazy var womanButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitleColor( UIColor(named: "womanColor"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Женщина", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 23
        button.layer.cornerCurve = .continuous
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(named: "womanColor")?.cgColor
        button.addTarget(self, action: #selector(genderPressed(_:)), for: .touchUpInside) //test
        button.tag = 2
        return button
    }()
    
    private var mView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "manColor")?.withAlphaComponent(0.1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.zPosition = 1000
        return view
    }()
    
    private var wView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "womanColor")?.withAlphaComponent(0.1)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "man")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private let wImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "woman")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(manButton)
        stackView.addArrangedSubview(womanButton)
        
        manButton.addSubview(mView)
        mView.addSubview(mImage)
        
        womanButton.addSubview(wView)
        wView.addSubview(wImage)
        
        setConstraintsStack()
        
    }
    
    
    
    @objc func genderPressed(_ sender: UIButton!) {
        print(sender.tag)
        if sender.tag == 1 {
            manButton.setTitleColor(.white, for: .normal)
            manButton.backgroundColor = UIColor(named: "manColor")
            mView.layer.backgroundColor = UIColor(named: "manColorPressed")?.cgColor
            mImage.image = mImage.image?.withRenderingMode(.alwaysTemplate)
            mImage.tintColor = .white
            
            womanButton.setTitleColor(UIColor(named: "womanColor"), for: .normal)
            womanButton.backgroundColor = .white
            wImage.image = wImage.image?.withRenderingMode(.alwaysTemplate)
            wImage.tintColor = UIColor(named: "womanColor")
            wView.layer.backgroundColor = UIColor(named: "womanColor")?.withAlphaComponent(0.1).cgColor
        } else if sender.tag == 2 {
            womanButton.setTitleColor(.white, for: .normal)
            womanButton.backgroundColor = UIColor(named: "womanColor")
            wView.layer.backgroundColor = UIColor(named: "womanColor")?.withAlphaComponent(0.1).cgColor
            wImage.image = wImage.image?.withRenderingMode(.alwaysTemplate)
            wImage.tintColor = .white
            
            
            manButton.setTitleColor(UIColor(named: "manColor"), for: .normal)
            manButton.backgroundColor = .white
            mImage.image = mImage.image?.withRenderingMode(.alwaysTemplate)
            mImage.tintColor = .white
            mView.layer.backgroundColor = UIColor(named: "manColorPressed")?.cgColor
        }
    }
    
    private func setConstraintsStack() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            manButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2) - 2),
            manButton.heightAnchor.constraint(equalToConstant: 46),
            womanButton.widthAnchor.constraint(equalToConstant: (view.frame.size.width / 2) - 2),
            womanButton.heightAnchor.constraint(equalToConstant: 46),
            
            mView.topAnchor.constraint(equalTo: manButton.topAnchor, constant: 5),
            mView.leadingAnchor.constraint(equalTo: manButton.leadingAnchor, constant: 5),
            mView.bottomAnchor.constraint(equalTo: manButton.bottomAnchor, constant: -5),
            mView.widthAnchor.constraint(equalToConstant: 36),
            
            mImage.centerYAnchor.constraint(equalTo: mView.centerYAnchor),
            mImage.centerXAnchor.constraint(equalTo: mView.centerXAnchor),
            mImage.widthAnchor.constraint(equalToConstant: 35),
            
            wView.topAnchor.constraint(equalTo: womanButton.topAnchor, constant: 5),
            wView.leadingAnchor.constraint(equalTo: womanButton.leadingAnchor, constant: 5),
            wView.bottomAnchor.constraint(equalTo: womanButton.bottomAnchor, constant: -5),
            wView.widthAnchor.constraint(equalToConstant: 36),
            
            wImage.centerYAnchor.constraint(equalTo: wView.centerYAnchor),
            wImage.centerXAnchor.constraint(equalTo: wView.centerXAnchor),
            wImage.widthAnchor.constraint(equalToConstant: 35)

        ])
    }


}

