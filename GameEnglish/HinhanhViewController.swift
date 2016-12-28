//
//  HinhanhViewController.swift
//  GameEnglish
//
//  Created by dinhngan on 12/25/16.
//  Copyright © 2016 dinhngan. All rights reserved.
//

import UIKit

class HinhanhViewController: UIViewController {

  
    @IBOutlet var progressView: UIProgressView!
   
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var answerButtons: [UIButton]!
   
    @IBAction func answerButtonHandler(sender: UIButton) {
        timer.invalidate()
        if sender.titleLabel!.text == correctAnswer{
            print("correct")
            currentScore += 1
            nextButon.enabled = true
        }
        else{
            sender.backgroundColor = UIColor.redColor()
            print("wrong answer")
            showAlert(false)
        }
        for button in answerButtons {
            button.enabled = false
            if button.titleLabel!.text == correctAnswer{
                button.backgroundColor = UIColor.greenColor()
            }
        }
      
    }
    
    @IBOutlet var nextButon: UIButton!
    
    
    @IBAction func nextButtonHandler(sender: AnyObject) {
        nextButon.enabled = false
        if questionIdx < imgArray!.count - 1{
            questionIdx += 1
        }else{
            questionIdx = 0
        }
        nextQuestion()
    }
    var correctAnswer: String?
    var image: String?
    var answers = [String]()
    var questionIdx = 0
    var timer = NSTimer()
    var currentScore = 0
    var highscore = NSUserDefaults.standardUserDefaults().integerForKey("highscore")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(patternImage: UIImage(named: bgImage!)!)
        
         progressView.transform = CGAffineTransformScale(progressView.transform, 1, 10)
        
        nextButon.enabled = false
        imgArray!.shuffle()
        nextQuestion()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion(){
        let currentQuestion = imgArray![questionIdx]
        
        answers = currentQuestion["Answers"] as! [String]
        correctAnswer = currentQuestion["CorrectAnswer"] as? String
        image = currentQuestion["Image"] as? String
        
        titlesForButtons()
    }

    
    func titlesForButtons(){
        for (idx,button) in answerButtons.enumerate(){
            button.titleLabel!.lineBreakMode = .ByWordWrapping
            button.setTitle(answers[idx], forState: .Normal)
            button.enabled = true
            button.backgroundColor = UIColor.blueColor()
            
        }
        imageView.image = UIImage(named: image!)
        startTimer()
    }
    func startTimer(){
        progressView.progress = 1.0
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(HinhanhViewController.updateProgressView), userInfo: nil, repeats: true)
    }
    func updateProgressView() {
        progressView.progress -= 0.01/15
        if progressView.progress <= 0 {
            outOfTime()
        }
    }
    func outOfTime(){
        timer.invalidate()
        showAlert(true)
        disableButtons()
        
    }
    func disableButtons(){
        for button in answerButtons{
            button.enabled = false
        }
    }
    
    func showAlert(slow: Bool){
        if currentScore > highscore{
            highscore = currentScore
            NSUserDefaults.standardUserDefaults().setInteger(highscore, forKey: "highscore")
        }
        NSUserDefaults.standardUserDefaults().setInteger(currentScore, forKey: "score")
        
        var title: String?
        if slow{
            title = "Too slow"
        }else{
            title = "Wrong Answer"
        }
        
        let alertController = UIAlertController(title: title, message: "Score: \(currentScore) \n Highscore: \(highscore)",preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: {(alert: UIAlertAction!) in
            self.backToMenu()
        })
        alertController.addAction(ok)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    func backToMenu() {
        navigationController?.popToRootViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
