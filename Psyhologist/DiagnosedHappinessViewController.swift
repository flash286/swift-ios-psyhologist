//
//  DiagnosedHappinessViewController.swift
//  Psyhologist
//
//  Created by Брызгалов Николай on 01.03.15.
//  Copyright (c) 2015 Bryzgalov Nikolay. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
    
    override var happines: Int {
        didSet {
            diagnosticHistory += [happines]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        set { defaults.setObject(newValue, forKey: History.DefaultsKey) }
        get { return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? [] }
    }
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History" 
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
}


