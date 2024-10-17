//
//  FoodDeliveryTextField.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 16.09.2024.
//

import UIKit

class FoodDeliveryTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)

    init() {
        super.init(frame: .zero)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}

private extension FoodDeliveryTextField {
    func setupLayout() {
        self.layer.cornerRadius = 25
        self.backgroundColor = AppColors.gray
        self.placeholder = "Some text"
        self.font = .Roboto.regular.size(of: 14)
        self.textColor = AppColors.black
        // Пример как сделать отступ в TF не используя функции написвнные ранее
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.height))
//        self.leftView = paddingView
//        self.rightView = paddingView
//        self.leftViewMode = .always
//        self.rightViewMode = .always
    }
}
