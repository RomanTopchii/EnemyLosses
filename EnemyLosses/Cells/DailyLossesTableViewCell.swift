//
//  DailyLossesTableViewCell.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import UIKit

class DailyLossesTableViewCell: UITableViewCell {
    
    func setup(losses: Losses) {
        self.textLabel?.text = String(losses.day) + losses.items.first!.name + String(losses.items.first!.amount) + String(losses.items.first!.diff)
    }
}
