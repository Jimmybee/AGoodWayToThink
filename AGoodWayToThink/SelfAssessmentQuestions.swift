//
//  SelfAssessmentQuestions.swift
//  AGoodWayToThink
//
//  Created by James Birtwell on 18/06/2017.
//  Copyright © 2017 James Birtwell. All rights reserved.
//

import Foundation

struct SelfAssessmentQuestion {
    
    let question: String
    let elementType: HappinessElementType
    var score = 0
    
    init(question: String, elementType: HappinessElementType) {
        self.question = question
        self.elementType =  elementType
    }
    
}

class SelfAssessmentQuestions {
    
    static func AllQuestions() -> [SelfAssessmentQuestion] {
        return [q1, q2, q3, q4, q5]
    }
    
    static let q1 = SelfAssessmentQuestion(question: "How succesful do you view yourself at cultivating positive thoughts?", elementType: .PostiveThoughts)
    static let q2 = SelfAssessmentQuestion(question: "We all think about the future and the past - do you worry and regret or anticipate and gratefully reminisce", elementType: .GratefulMindset)
    static let q3  = SelfAssessmentQuestion(question: "Do you find yourself often giving thanks for the miracles in your life, or do you focus more on achieving successive goals.", elementType: .HealthyPerspective)
    static let q4 = SelfAssessmentQuestion(question: "Do you feel a sense of meaningful connectedness? (a rewarding social network, creative or professional output etc.)", elementType: .LovingConnections)
    static let q5 = SelfAssessmentQuestion(question: "Do you carefully monitor your personal needs of achievement, pleasure, personal space, hobbies etc.?", elementType: .LifeAlignedToValues)
}
