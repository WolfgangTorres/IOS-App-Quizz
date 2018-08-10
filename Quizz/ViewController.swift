//
//  ViewController.swift
//  Quizz
//
//  Created by Andres Torres on 8/10/18.
//  Copyright © 2018 andytb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questinLabel: UILabel!
    @IBOutlet weak var scoreL: UILabel!
    @IBOutlet weak var progressB: UIView!
    @IBOutlet weak var progressL: UILabel!
    
    @IBAction func buttonPress(_ sender: UIButton) {
        if sender.tag == 1{
            pickAnswer = true
        }
        else if sender.tag == 2{
            pickAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
 
    let allQuestions = QuestionBank()
    var pickAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func updateUI() {
        scoreL.text = "Score: \(score)"
        progressL.text = "\(questionNumber+1)/13"
        progressB.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber+1)
        
    }
    
    
    func nextQuestion() {
        if questionNumber > 12{
            let alert = UIAlertController(title: "Yeah", message: "You finished all the question, you want start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            questinLabel.text = allQuestions.list[questionNumber].question
            updateUI()
        }
    }
    
    
    func checkAnswer() {
        if pickAnswer == allQuestions.list[questionNumber].answer{
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else{
            ProgressHUD.showError("Wrong")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        score = 0
        nextQuestion()
        
    }


}

