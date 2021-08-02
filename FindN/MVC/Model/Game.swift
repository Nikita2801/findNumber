//
//  Game.swift
//  FindN
//
//  Created by 1 on 01.08.2021.
//

import Foundation

enum StatusGame{
    case start
    case win
}

class Game {
    
    struct Item{
        var title: String
        var isFound: Bool = false
        
    }
    
    private let data = Array(1...99)
    
     var items:[Item] = []
    
    var status: StatusGame = .start
    
    private var countItem: Int
    
    var nextItem: Item?
    
    init(countItem:Int) {
        self.countItem = countItem
        setupGame()
    }
    
    private func setupGame(){
        var digits = data.shuffled()
        
        while items.count < countItem{
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }
        
        nextItem = items.shuffled().first
    }
    
    func check(index:Int) {
        
        if items[index].title == nextItem?.title{
            items[index].isFound = true
            nextItem = items.shuffled().first(where: { (item) -> Bool in
                item.isFound == false
            })
        }
        if nextItem == nil{
            status = .win
        }
    }
    
}
