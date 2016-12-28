//
//  ViewController.swift
//  GameEnglish
//
//  Created by dinhngan on 12/25/16.
//  Copyright © 2016 dinhngan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scoreLabe: UILabel!
  
    @IBOutlet var highscoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor(patternImage: UIImage(named: bgImage!)!)
        
   
    loadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let score = NSUserDefaults.standardUserDefaults().integerForKey("score")
        let highscore = NSUserDefaults.standardUserDefaults().integerForKey("highscore")
     
        scoreLabe.text = "Score: \(score)"
        highscoreLabel.text = "Highscore: \(highscore)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadData(){
        let pathMC = NSBundle.mainBundle().pathForResource("MultipleChoice", ofType: "plist")
        let dictMC = NSDictionary(contentsOfFile: pathMC!)
        mcArray = dictMC!["Questions"]!.mutableCopy() as? Array
        
        
        let pathIMG = NSBundle.mainBundle().pathForResource("ImageQuiz", ofType: "plist")
        let dictIMG = NSDictionary(contentsOfFile: pathIMG!)
        imgArray = dictIMG!["Questions"]!.mutableCopy() as? Array
        
        check()
    }
    func check() {
        print(mcArray)
        print(imgArray)
    }
}

