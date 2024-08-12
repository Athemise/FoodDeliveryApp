//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 05.08.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
       showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        let firstViewController = OnboardingPieceViewController()
        firstViewController.imageToShow = UIImage(resource: .chickenLeg)
        firstViewController.titleText = "Delicious Food"
        firstViewController.descriptionText = "ToDo"
        
        let secondViewController = OnboardingPieceViewController()
        secondViewController.imageToShow = UIImage(resource: .shipped)
        secondViewController.titleText = "Fast Shipping"
        secondViewController.descriptionText = "ToDo"
        
        let thirdViewController = OnboardingPieceViewController()
        thirdViewController.imageToShow = UIImage(resource: .medal)
        thirdViewController.titleText = "Certificate Food"
        thirdViewController.descriptionText = "ToDo"
        
        let fourthViewController = OnboardingPieceViewController()
        fourthViewController.imageToShow = UIImage(resource: .creditCard)
        fourthViewController.titleText = "Payment Online"
        fourthViewController.descriptionText = "ToDo"
        
        pages.append(firstViewController)
        pages.append(secondViewController)
        pages.append(thirdViewController)
        pages.append(fourthViewController)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
