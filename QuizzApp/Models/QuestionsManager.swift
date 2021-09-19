//
//  QuestionsManager.swift
//  QuizzApp
//
//  Created by Andre Almeida on 18/09/21.
//

import Foundation


struct QuestionManager {
    
    private var questionInstance = Question()
    private var _totalAnswers = 0
    private var _totalCorrectAnswers = 0
    
    var question: String {
        questionInstance.question
    }
    
    var alternatives: [String] {
        questionInstance.alternatives
    }
    
    var totalAnswers: Int {
        _totalAnswers
    }
    
    var totalCorrectAnswers: Int {
        _totalCorrectAnswers
    }
    
    mutating func chooseAnswer(_ answer: String) -> Bool? {
        guard let answer = Int(answer) else {return nil}
        _totalAnswers += 1
        if questionInstance.validateAnswer(answer) {
            _totalCorrectAnswers += 1
            return true
        }
        return false
    }
    
}
