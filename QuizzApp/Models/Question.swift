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
    
    private var correctAnswer: Int {
        numA * numB
    }
    
    var question: String {
        "Quanto é \(numA) × \(numB)?"
    }
    
    var alternatives: [String] {
        var alternatives = [Int]()
        alternatives.append(correctAnswer)
        
        while alternatives.count <= 4 {
            let randomNumber = Int.random(in: 0...100)
            if !alternatives.contains(randomNumber) {
                alternatives.append(randomNumber)
            }
        }
        return alternatives
            .map({String($0)})
            .shuffled()
    }
    
    
    func validateAnswer(_ number: Int) -> Bool {
        number == correctAnswer
    }
    
}
