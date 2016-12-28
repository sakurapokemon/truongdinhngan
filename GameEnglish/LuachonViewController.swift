//
//  LuachonViewController.swift
//  GameEnglish
//
//  Created by dinhngan on 12/25/16.
//  Copyright © 2016 dinhngan. All rights reserved.
//

import UIKit

class LuachonViewController: UIViewController {

    @IBOutlet var gameModeButtons: [UIButton]!
    @IBAction func gameModeButtonsHanler(sender: UIButton)
    
    
    {
        for button in gameModeButtons{
            if sender != button{
                button.alpha = 0.7
                button.backgroundColor = UIColor.blueColor()
                
            }
            else{
                button.alpha = 1.0
                gameMode = button.tag
                 button.backgroundColor = UIColor.orangeColor()
            }
        
        }
    
    }
   
    @IBAction func playButtons(sender: AnyObject) {
       
        var vc: UIViewController?
        switch gameMode {
            case 0:
                vc = storyboard?.instantiateViewControllerWithIdentifier("tracnghiemViewController")    as! TracnghiemViewController
             
            break
           
        case 1:
                vc = storyboard?.instantiateViewControllerWithIdentifier("hinhanhViewController") as!HinhanhViewController
            break
            
            default:
            break
        }
        if vc != nil {
        navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
     var gameMode = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       view.backgroundColor = UIColor(patternImage: UIImage(named: bgImage!)!)
     
        
        for (idx,button) in gameModeButtons.enumerate(){
            button.tag = idx
            if button.tag != 0 {
                    button.alpha = 0.7
            }
        }
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
