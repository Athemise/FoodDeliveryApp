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
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .orange
        
        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .yellow
        
        let fourthViewController = UIViewController()
        fourthViewController.view.backgroundColor = .green
        
        pages.append(firstViewController)
        pages.append(secondViewController)
        pages.append(thirdViewController)
        pages.append(fourthViewController)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
