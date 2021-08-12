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
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    lazy var game = Game(countItem: buttons.count) { [weak self] (status, time) in
        guard let self = self else {return}
        
        self.timerLabel.text = time.secondsToString()
        self.updateInfoGame(with: status)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        game.stopGame()
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index: buttonIndex)
        updateUI()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game.newGame()
        sender.isHidden = true
        setupScreen()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
       
    }
    
    private func setupScreen() {
        
        for index in game.items.indices {
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].alpha = 1
            buttons[index].isEnabled = !game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.title
    
    }
    
    
    func updateUI(){
        for index in game.items.indices{
            buttons[index].alpha = game.items[index].isFound ? 0 : 1
            buttons[index].isEnabled = !game.items[index].isFound
            
            if game.items[index].isError{
                UIView.animate(withDuration: 3) { [weak self] in
                    self?.buttons[index].backgroundColor = .red
                } completion: { [weak self] (_) in
                    self?.buttons[index].backgroundColor = .white
                    self?.game.items[index].isError = false
                }
            }
        }
        nextDigit.text = game.nextItem?.title
        
        if game.status == .win{
            statusLabel.text = "You win"
            statusLabel.textColor = .green
        }
    }
    
    private func updateInfoGame(with status:StatusGame) {
        switch status {
        case .start:
            statusLabel.text = "Game is Start"
            statusLabel.textColor = .black
            newGameButton.isHidden = true
        case .win:
            statusLabel.text = "Win"
            statusLabel.textColor = .green
            newGameButton.isHidden = false
        case .lose:
            statusLabel.text = "lose"
            statusLabel.textColor = .red
            newGameButton.isHidden = false
            
        }
    }

}
