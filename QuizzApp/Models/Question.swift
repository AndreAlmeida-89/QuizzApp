//
//  Question.swift
//  QuizzApp
//
//  Created by Andre Almeida on 18/09/21.
//

import Foundation

struct Question {
    private let numA = Int.random(in: 0...100)
    private let numB = Int.random(in: 0...100)
    private let numberOfAlternatives = 4
    
    private var correctAnswer: Int {
        numA * numB
    }
    
    var question: String {
        "Quanto é \(numA) × \(numB)?"
    }
    
    var alternatives: [String] {
        var alternatives = Set<Int>()
        alternatives.insert(correctAnswer)
        
        while alternatives.count < numberOfAlternatives {
            let randomNumber = Int.random(in: 0...100) * Int.random(in: 0...100)
                alternatives.insert(randomNumber)
        }
        return alternatives.map({String($0)})
    }
    
    func validateAnswer(_ number: Int) -> Bool {
        number == correctAnswer
    }
    
}
