//
//  Constants.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

struct Constants {
    struct CellsReuseIdentifier {
        static let dailyLosses = "DailyLossesTableViewCell"
    }
    
    struct Endpoints {
        static let equipmentLosses = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
        static let personnelLosses = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    }
}
