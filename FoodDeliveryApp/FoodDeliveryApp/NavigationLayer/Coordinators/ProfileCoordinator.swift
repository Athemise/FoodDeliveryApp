//
//  ProfileCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 05.08.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
        let viewController = ViewController()
        viewController.view.backgroundColor = AppColors.darkGray
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
