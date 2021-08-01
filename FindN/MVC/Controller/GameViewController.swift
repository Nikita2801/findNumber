//
//  GameViewController.swift
//  FindN
//
//  Created by 1 on 01.08.2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func pressButton(_ sender: UIButton) {
        sender.isHidden = true
        print(sender.currentTitle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    

}
