//
//  SceneFactory.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 25.08.2024.
//

import UIKit

struct SceneFactory {
    
    //MARK: - Onboarding flow
    static func makeOnboardingFlow(coordinator: AppCoordinator,finishDelegate: CoordinatorFinishDelegate, navigationController: UINavigationController) {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    static func makeOnboardingScene(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [OnboardingPieceViewController]()
        
        let firstViewController = OnboardingPieceViewController()
        firstViewController.imageToShow = UIImage(resource: .chickenLeg)
        firstViewController.titleText = "Delicious Food"
        firstViewController.descriptionText = "ToDo"
        firstViewController.buttonText = "Next"
        
        let secondViewController = OnboardingPieceViewController()
        secondViewController.imageToShow = UIImage(resource: .shipped)
        secondViewController.titleText = "Fast Shipping"
        secondViewController.descriptionText = "ToDo"
        secondViewController.buttonText = "Next"
        
        let thirdViewController = OnboardingPieceViewController()
        thirdViewController.imageToShow = UIImage(resource: .medal)
        thirdViewController.titleText = "Certificate Food"
        thirdViewController.descriptionText = "ToDo"
        thirdViewController.buttonText = "Next"
        
        let fourthViewController = OnboardingPieceViewController()
        fourthViewController.imageToShow = UIImage(resource: .creditCard)
        fourthViewController.titleText = "Payment Online"
        fourthViewController.descriptionText = "ToDo"
        fourthViewController.buttonText = "Let's go!"
        
        pages.append(firstViewController)
        pages.append(secondViewController)
        pages.append(thirdViewController)
        pages.append(fourthViewController)
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let viewController = OnboardingViewController(pages: pages, viewOutput: presenter)
        
        return viewController
    }
    
    //MARK: - Main flow
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "circle"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(type: .order, navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(title: "Order", image: UIImage.init(systemName: "circle"), tag: 1)
        orderCoordinator.finishDelegate = finishDelegate
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(type: .list, navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(title: "List", image: UIImage.init(systemName: "circle"), tag: 2)
        listCoordinator.finishDelegate = finishDelegate
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "circle"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(orderCoordinator)
        coordinator.addChildCoordinator(listCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
     
        return tabBarController
    }
}
