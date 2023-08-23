//
//  LossesTableViewController.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import UIKit

class LossesTableViewController: UITableViewController {
    
    private let enemyLossesService = EnemyLossesService(equipmentLossesRepository: EquipmentLossesRepositoryImpl(),
                                                        personnelLossesRepository: PersonnelLossesRepositoryImpl())
    
    private var losses: [Losses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(LossesTableViewCell.self, forCellReuseIdentifier: Constants.CellsReuseIdentifier.dailyLosses.rawValue)
        self.enemyLossesService.delegate = self
        self.loadData()
    }
    
    private func loadData() {
        self.enemyLossesService.loadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.losses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellsReuseIdentifier.dailyLosses.rawValue, for: indexPath) as! LossesTableViewCell
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "\(Bundle.main.localizations.first ?? "en")_\(Locale.current.regionCode ?? "US")")
      
        
        cell.setup(losses: self.losses[indexPath.row], dateFormatter: formatter)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension LossesTableViewController: EnemyLossesServiceDelegate {
    func presentData(losses: [Losses]) {
        self.losses = losses.sorted(by: {$0.day > $1.day})
        self.tableView.reloadData()
    }
}
