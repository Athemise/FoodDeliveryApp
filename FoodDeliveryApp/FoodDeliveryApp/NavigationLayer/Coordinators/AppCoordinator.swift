//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 05.08.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        if userStorage.passedOnboarding {
            showAuthFlow()
        } else {
            showOnboardingFlow()
        }
        let loginPresentr = LoginPresenter(coordinator: self)
        let loginViewController = LoginViewController(viewOutput: loginPresentr, state: .initial)
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}

// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController else { return }
        factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    func showMainFlow() {
        guard let navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    func showAuthFlow() {
        guard let navigationController else { return }
        let viewController = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

//MARK: - Methods
extension AppCoordinator {
    func showSignInScene() {
        guard let navigationController else { return }
        let viewController = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    func showSignUpScene() {
        guard let navigationController else { return }
        let viewController = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordintor: CoordinatorProtocol) {
        removeChildCoordinator(childCoordintor)
        
        switch childCoordintor.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showAuthFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
