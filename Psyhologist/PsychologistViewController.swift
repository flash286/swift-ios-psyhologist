//
//  ViewController.swift
//  Psyhologist
//
//  Created by Брызгалов Николай on 28.02.15.
//  Copyright (c) 2015 Bryzgalov Nikolay. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "sad": hvc.happines = 0
                    case "happy": hvc.happines = 100
                    case "nothing": hvc.happines = 25
                    default: hvc.happines = 50
                }
            }
        }
    }
}

