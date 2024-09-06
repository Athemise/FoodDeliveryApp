//
//  OnboardingViewController.swift
//  FoodDeliveryApp
//
//  Created by Alexander Balakhonov on 05.08.2024.
//

import UIKit

//MARK: - OnboardingViewController
class OnboardingViewController: UIViewController {

    
    // MARK: - Properties
    private var pages = [OnboardingPieceViewController]()
    private var bTitle = "Next"
    private var currentPageIndex = 0
    
    // MARK: - Views
    private var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageControl = UIPageControl()
    var viewOutput: OnboardingViewOutput!
    private var bottomButton = FoodDeliveryButton()
    
    init(pages: [OnboardingPieceViewController] = [OnboardingPieceViewController](), viewOutput: OnboardingViewOutput!) {
        self.pages = pages
        self.viewOutput = viewOutput
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

//MARK: - Actions
private extension OnboardingViewController {
    @objc func buttonPressed() {
        switch pageControl.currentPage {
        case 0:
            pageControl.currentPage = 1
            bottomButton.setTitle(pages[1].buttonText)
            pageViewController.setViewControllers([pages[1]], direction: .forward, animated: true)
        case 1:
            pageControl.currentPage = 2
            bottomButton.setTitle(pages[2].buttonText)
            pageViewController.setViewControllers([pages[2]], direction: .forward, animated: true)
        case 2:
            pageControl.currentPage = 3
            bottomButton.setTitle(pages[3].buttonText)
            pageViewController.setViewControllers([pages[3]], direction: .forward, animated: true)
        case 3:
            print("Exit")
            viewOutput.onboardingFinish()
        default:
            break
        }
    }
}

//MARK: - Layout
private extension OnboardingViewController {
    func setupLayout() {
        setupPageViewController()
        setupPageControl()
        setupButton()
    }
    func setupPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.backgroundColor = AppColors.myOrange
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: true)
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        let page = pages[0]
        let title = page.buttonText
        bottomButton.setTitle(title)
        pageControl.isUserInteractionEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
    func setupButton() {
        view.addSubview(bottomButton)
        bottomButton.action = buttonPressed
        bottomButton.scheme = .gray
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -30),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

//MARK: - UIPageViewControllerDataSource delegate
extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPieceViewController), currentIndex > 0 else { return nil }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnboardingPieceViewController), currentIndex < pages.count - 1 else { return nil }
        return pages[currentIndex + 1]
    }
}

//MARK: - UIPageViewControllerDelegate delegate
extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = pages.firstIndex(of: pendingViewControllers.first! as! OnboardingPieceViewController) {
            currentPageIndex = index
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            pageControl.currentPage = currentPageIndex
            let page = pages[currentPageIndex]
            bTitle = page.buttonText ?? "Next"
            bottomButton.setTitle(bTitle)
        }
    }
}
