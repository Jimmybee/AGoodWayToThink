//
//  OboardingQuestionView.swift
//  AGoodWayToThink
//
//  Created by James Birtwell on 18/06/2017.
//  Copyright © 2017 James Birtwell. All rights reserved.
//

import UIKit

class OboardingQuestionView: UIView {

    static func storyboardInit(owner: UIViewController, question: SelfAssessmentQuestion) -> OboardingQuestionView {
        let bundle = Bundle(for: OboardingQuestionView.self)
        let nib = bundle.loadNibNamed(self.nib, owner: owner, options: nil)
        let view = nib?.first as? OboardingQuestionView
        view!.question = question
        return view!
    }
    static var nib = "OboardingQuestionView"
    var question: SelfAssessmentQuestion!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    override init(frame:CGRect) {
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {

    }
    


}
