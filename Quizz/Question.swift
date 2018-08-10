//
//  AppDelegate.swift
//  Quizz
//
//  Created by Andres Torres on 8/10/18.
//  Copyright © 2018 andytb. All rights reserved.
//

import Foundation

class Question{
    
    let question: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool){
        question = text
        answer = correctAnswer
    }
}
