//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 26.08.2024.
//

import UIKit

class LoginViewController: UIViewController {

    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

private extension LoginViewController {
    func setupLayout() {
        view.backgroundColor = AppColors.white
        setpBottomView()
    }
    func setpBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        bottomView.buttonActionOne = googlePress
        bottomView.buttonACtionTwo = facebookPress
    }
    func googlePress() {
        print("Google!")
    }
    func facebookPress() {
        print("Facebook!")
    }
}

#Preview("LoginViewController") {
    LoginViewController()
}
