//
//  QuestionsManager.swift
//  QuizzApp
//
//  Created by Andre Almeida on 18/09/21.
//

import Foundation


class QuestionManager {
    
    private var questionInstance: Question
    static private(set) var _totalAnswers = 0
    static private(set) var _totalCorrectAnswers = 0
    static private let _limit = 10
    
    init() {
        self.questionInstance = Question()
    }
    
    var question: String {
        questionInstance.question
    }
    
    var alternatives: [String] {
        questionInstance.alternatives
    }
    
    var totalAnswers: Int {
        QuestionManager._totalAnswers
    }
    
    var totalCorrectAnswers: Int {
        QuestionManager._totalCorrectAnswers
    }
    
    var limit: Int {
        QuestionManager._limit
    }
    
    func chooseAnswer(_ answer: String) -> Bool? {
        guard let answer = Int(answer) else {return nil}
        QuestionManager._totalAnswers += 1
        if questionInstance.validateAnswer(answer) {
            QuestionManager._totalCorrectAnswers += 1
            return true
        }
        return false
    }
    
    class func reset(){
        QuestionManager._totalAnswers = 0
        QuestionManager._totalCorrectAnswers = 0
    }
    
}
