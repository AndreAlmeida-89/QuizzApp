//
//  String.swift
//  QuizzApp
//
//  Created by Andre Almeida on 18/09/21.
//

import Foundation

struct Strings {
    static let navigationBarTitle = "Perguntas e respostas"
    
    struct StartScene {
        static let title = "Perguntas e Respostas"
        static let subtitle = "Responda 10 perguntas e veja sua pontuação no fim!"
    }
    
    struct ButtonTitle {
        static let signin  = "Entrar"
        static let start  = "Start!"
        static let answer  = "Responder"
        static let nextQuestion  = "Próxima pergunta"
        static let tryAgain = "Tentar novamente"
    }
    
    struct QuestionScene{
        static let answers = "Respostas"
    }
    
    struct FinalScene {
        static let title = "Perguntas e Respostas"
        static let subtitle = "Sua pontuação doi de:"
        static let correct = { (correct: Int, total: Int) in
            "\(correct)/\(total) Acertos"
        }
    }
}
