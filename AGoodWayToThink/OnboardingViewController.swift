//
//  OnboardingViewController.swift
//  AGoodWayToThink
//
//  Created by James Birtwell on 18/06/2017.
//  Copyright © 2017 James Birtwell. All rights reserved.
//

import UIKit
import PureLayout

class OnboardingViewController: UIViewController {

    /// Create scrollView. Pin to superview
    /// Horizontal stackview. Pin to superview.
    /// Create arranged views. Equal width to View. equal Height to view.
    
    fileprivate(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = false
        return scrollView
    }()
    
    fileprivate(set) lazy var scrollStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    
    fileprivate(set) lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.tintColor = .white
        return pageControl
    }()
    
    fileprivate(set) lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        return nextButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.autoPinEdgesToSuperviewEdges()
        scrollView.addSubview(scrollStack)
        scrollStack.autoPinEdgesToSuperviewEdges()
        
        let view1 = OboardingQuestionView.storyboardInit(owner: self)
        let view2 = OboardingQuestionView.storyboardInit(owner: self)
        
        let views = [view1, view2]
        
        views.forEach { (view) in
            scrollStack.addArrangedSubview(view)
            view.autoMatch(.width, to: .width, of: view)
        }
        
        view1.autoMatch(.height, to: .height, of: view)
        
        view.addSubview(pageControl)
        view.bringSubview(toFront: pageControl)
        pageControl.numberOfPages = 6
        pageControl.autoPinEdge(.bottom, to: .bottom, of: scrollStack)
        pageControl.autoAlignAxis(toSuperviewAxis: .vertical)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
