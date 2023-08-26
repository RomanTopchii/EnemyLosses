//
//  Constants.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 22.08.2023.
//

import Foundation

struct Constants {
    enum CellsReuseIdentifier: String {
        case dailyLosses = "DailyLossesTableViewCell"
    }
    
    enum Endpoints: String {
        case equipmentLosses = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
        case personnelLosses = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    }
}
