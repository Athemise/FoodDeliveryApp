//
//  FoodDeliveryButton.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 06.09.2024.
//

import UIKit

enum FoodDeliveryButtonColorSchemes {
    case white
    case orange
    case gray
}

class FoodDeliveryButton: UIView {

    private let button = UIButton()
    var action: (() -> Void)?
    var scheme: FoodDeliveryButtonColorSchemes = .white {
        didSet {
            setColorScheme(scheme: scheme)
        }
    }
    
    init(scheme: FoodDeliveryButtonColorSchemes = .white) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension FoodDeliveryButton {
    @objc func buttonPressed() {
        guard let action else { return }
        action()
    }
}

extension FoodDeliveryButton {
    private func setupLayout() {
        setupButton()
    }
    
    private func setupButton() {
        self.addSubview(button)
        button.titleLabel?.font = .Roboto.bold.size(of: 18)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    private func setColorScheme(scheme: FoodDeliveryButtonColorSchemes) {
        switch scheme {
        case .white:
            button.backgroundColor = AppColors.white
            button.setTitleColor(AppColors.myOrange, for: .normal)
        case .orange:
            button.backgroundColor = AppColors.myOrange
            button.setTitleColor(AppColors.white, for: .normal)
        case .gray:
            button.backgroundColor = AppColors.gray
            button.setTitleColor(AppColors.black, for: .normal)
        }
    }
    public func setTitle(_ title: String?) {
        button.setTitle(title, for: .normal)
    }
}
