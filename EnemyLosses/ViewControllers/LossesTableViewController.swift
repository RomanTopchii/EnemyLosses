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
        tableView.register(DailyLossesTableViewCell.self, forCellReuseIdentifier: Constants.CellsReuseIdentifier.dailyLosses.rawValue)
        loadData()
    }
    
    private func loadData() {
        self.losses = enemyLossesService.getAll().sorted(by: {$0.day > $1.day})
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.losses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellsReuseIdentifier.dailyLosses.rawValue, for: indexPath) as! DailyLossesTableViewCell
        cell.setup(losses: self.losses[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
