//
//  GameViewController.swift
//  FindN
//
//  Created by 1 on 01.08.2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
   lazy var game = Game(countItem: buttons.count)
    
    
    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index: buttonIndex)
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    private func setupScreen() {
        
        for index in game.items.indices {
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
        }
        nextDigit.text = game.nextItem?.title
    
    }
    
    
    func updateUI(){
        for index in game.items.indices{
            buttons[index].isHidden = game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.title
        
        if game.status == .win{
            statusLabel.text = "You win"
            
        }
    }

}
