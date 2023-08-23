//
//  Item.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

class Item {
    var name: String
    var amount: Int?
    //var diff: Int
    
    init(name: String, todayAmount: Int?, yesterdayAmount: Int?) {
        self.name = name
        self.amount = todayAmount
        //self.diff = todayAmount - (yesterdayAmount ?? 0)
    }
}
