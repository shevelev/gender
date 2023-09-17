//
//  customButtonChoose.swift
//  gender
//
//  Created by Сергей Шевелев on 17.09.2023.
//

import UIKit

final class CustomButtonChoose: UIButton {
    
    //MARK: - Properties
    var title: String = ""
    var image: String = ""
    var color: String = ""
    
    //MARK: - CircleBackground
    private lazy var buttonView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: self.image)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    init(_title: String, _image: String, _color: String) {
        super.init(frame: .zero)
        self.title = _title
        self.image = _image
        self.color = _color
        
        setTitle(title, for: .normal)
        layer.cornerRadius = 23
        layer.cornerCurve = .continuous
        layer.borderWidth = 1
        layer.borderColor  = UIColor(named: color)?.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        
        showTrue()
        setupButtons()
    }
    
    private func setupButtons() {
        self.addSubview(buttonView)
        buttonView.addSubview(buttonImage)
        
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            buttonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            buttonView.widthAnchor.constraint(equalToConstant: 36),
            
            buttonImage.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            buttonImage.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            buttonImage.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func showTrue() {
        backgroundColor = .white
        setTitleColor( UIColor(named: color), for: .normal)
        buttonView.backgroundColor = UIColor(named: color)?.withAlphaComponent(0.6)
        buttonImage.image = buttonImage.image?.withRenderingMode(.alwaysTemplate)
        buttonImage.tintColor = UIColor(named: color)
    }
    
    private func showFalse() {
        backgroundColor = UIColor(named: color)
        setTitleColor(.white, for: .normal)
        buttonView.backgroundColor =  .white.withAlphaComponent(0.2)
        buttonImage.image = buttonImage.image?.withRenderingMode(.alwaysTemplate)
        buttonImage.tintColor = .white
    }
    
    func show(_ show: Bool) {
        if show {
            showTrue()
        } else {
            showFalse()
        }
    }
}
