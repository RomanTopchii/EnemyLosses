//
//  LossesTableViewCell.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import UIKit

class LossesTableViewCell: UITableViewCell {
    
    func setup(losses: Losses, dateFormatter: DateFormatter) {
        self.textLabel?.numberOfLines = 0
        
        var details = dateFormatter.string(from: losses.date)
        
        for item in losses.items where item.amount != nil {
            details += "\n" + item.name + " - " + (item.amount != nil ? String(item.amount!) : "")
        }
        
        self.textLabel?.text = details
    }
}
