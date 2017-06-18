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

    /// Create scrollView. Pin to supervievar   /// Horizontal stackview. Pin to superview.
    /// Create arranged views. Equal width to View. equal Height to view.

    var questions = SelfAssessmentQuestions.AllQuestions()
    var questionViews = [OboardingQuestionView]()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var onTopView: UIView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var nextBttn: UIButton!
    @IBOutlet weak var slider: UISlider!

    
    fileprivate(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    }()
    
    fileprivate(set) lazy var scrollStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        return stack
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let allViews = [nextBttn, titleLabel, onTopView, scrollView, pageIndicator]
        allViews.forEach({ $0?.alpha = 0})
        UIView.animate(withDuration: 0.3) {
            allViews.forEach({ $0?.alpha = 1})
        }
        
        view.addSubview(scrollView)
        scrollView.autoPinEdgesToSuperviewEdges()
        scrollView.addSubview(scrollStack)
        scrollStack.autoPinEdgesToSuperviewEdges()
        
        
        questionViews = questions.map { (question) -> OboardingQuestionView in
            return OboardingQuestionView.storyboardInit(owner: self, question: question)
        }
        
        for (index, questionView) in questionViews.enumerated() {
            scrollStack.addArrangedSubview(questionView)
            questionView.autoMatch(.width, to: .width, of: view)
            questionView.questionLabel.text = questions[index].question
        }
        
        
        questionViews[0].autoMatch(.height, to: .height, of: view)
        
        view.bringSubview(toFront: onTopView)
        view.bringSubview(toFront: nextBttn)
        
        setupPageControl()

    }
    
    func setupPageControl() {
        pageIndicator.numberOfPages = questionViews.count
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        let pageWidth = view.bounds.size.width
        let currentOffset = scrollView.contentOffset
        let newOffset = CGPoint(x: currentOffset.x + pageWidth, y: 0)
        scrollView.setContentOffset(newOffset, animated: true)

    }
    
    func doneTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension OnboardingViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let newPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.size.width)
        
        if newPage > (pageIndicator.currentPage - 1) {
            updateModel(questionNumber: pageIndicator.currentPage)
        } else {
            updateSlider(questionNumber: newPage)
        }
        
        pageIndicator.currentPage = newPage
        if pageIndicator.currentPage == questionViews.count - 1 {
            nextBttn.setTitle("Done", for: .normal)
            nextBttn.removeTarget(self, action: #selector(nextTapped(_:)), for: .touchUpInside)
            nextBttn.addTarget(self, action: #selector(doneTapped(_:)), for: .touchUpInside)
        } else {
            nextBttn.setTitle("Next", for: .normal)
            nextBttn.removeTarget(self, action: #selector(doneTapped(_:)), for: .touchUpInside)
            nextBttn.addTarget(self, action: #selector(nextTapped(_:)), for: .touchUpInside)
        }
        
        
    }
    
    func updateSlider(questionNumber: Int) {
        slider.value = Float(questions[questionNumber].score)
    }
    
    func updateModel(questionNumber: Int) {
        questions[questionNumber].score = Int(slider.value)
    }
}
