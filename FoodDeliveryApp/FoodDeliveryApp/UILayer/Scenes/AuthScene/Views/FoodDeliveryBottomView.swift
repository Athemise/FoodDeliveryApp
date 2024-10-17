//
//  BottomView.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 26.08.2024.
//

import UIKit

class FoodDeliveryBottomView: UIView {
    
    //MARK: - Views
    private let label = UILabel()
    private let view1 = UIView()
    private let bottomImageView = UIImageView()
    private let facebookButton = UIButton()
    private let googleButton = UIButton()
    
    var buttonActionOne: (() -> Void)?
    var buttonACtionTwo: (() -> Void)?

    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Actions
private extension FoodDeliveryBottomView {
    @objc func googleButtonPressed() {
        buttonActionOne?()
    }
    @objc func facebookButtonPressed() {
        buttonACtionTwo?()
    }
}

//MARK: - Layout
private extension FoodDeliveryBottomView {
    func setupLayout() {
        self.backgroundColor = AppColors.white
        setupLabel()
        setupView1()
        setupBottomImage()
        setupGoogleImage()
        setupFacebookImage()
    }
    
    func setupLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Or connect with"
        label.font = .Roboto.regular.size(of: 16)
        label.textColor = AppColors.darkGray
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }
    func setupView1() {
        self.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = AppColors.halfDarkGray
        
        NSLayoutConstraint.activate([
            view1.centerYAnchor.constraint(equalTo: label.centerYAnchor, constant: 0),
            view1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -12),
            view1.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
    func setupBottomImage() {
        self.addSubview(bottomImageView)
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.image = UIImage(named: "BottomViewImage")
        
        NSLayoutConstraint.activate([
            bottomImageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            bottomImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -75),
            bottomImageView.widthAnchor.constraint(equalToConstant: 282),
            bottomImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    func setupGoogleImage() {
        self.addSubview(googleButton)
        googleButton.setImage(UIImage(resource: .google), for: .normal)
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            googleButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            googleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            googleButton.widthAnchor.constraint(equalToConstant: 40),
            googleButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        googleButton.layer.cornerRadius = googleButton.frame.width / 2
        googleButton.addTarget(self, action: #selector(googleButtonPressed), for: .touchUpInside)
    }
    func setupFacebookImage() {
        self.addSubview(facebookButton)
        facebookButton.setImage(UIImage(resource: .facebook), for: .normal)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            facebookButton.centerYAnchor.constraint(equalTo: googleButton.centerYAnchor),
            facebookButton.trailingAnchor.constraint(equalTo: googleButton.leadingAnchor, constant: -20),
            facebookButton.widthAnchor.constraint(equalToConstant: 40),
            facebookButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        facebookButton.addTarget(self, action: #selector(facebookButtonPressed), for: .touchUpInside)
    }
}


#Preview("BottomView", traits: .fixedLayout(width: 400, height: 150)) {
    FoodDeliveryBottomView()
}
