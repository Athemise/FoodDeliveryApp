//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 05.08.2024.
//

import UIKit

//MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
       showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordintor: self)
    }
}

//MARK: - Navigation
private extension OnboardingCoordinator {
    func showOnboarding() {
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
