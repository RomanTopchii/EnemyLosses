//
//  LossesTableViewController.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 21.08.2023.
//

import UIKit

class LossesTableViewController: UITableViewController {
    
    private let enemyLossesService = EnemyLossesService(unitOfWork: UnitOfWorkImpl())
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "\(Bundle.main.localizations.first ?? "en")_\(Locale.current.language.region?.identifier ?? "US")")
        return formatter
    }()
    
    private var losses: [Losses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Enemy losses"
        self.enemyLossesService.delegate = self
        self.configureTableViewRefreshControl()
        self.tableView.register(LossesTableViewCell.self, forCellReuseIdentifier: Constants.CellsReuseIdentifier.dailyLosses)
        self.tableView.refreshControl?.beginRefreshing()
        self.loadData()
    }
    
    private func configureTableViewRefreshControl(){
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func loadData() {
        self.enemyLossesService.loadData()
    }
}

//MARK: - TableView delegates methods
extension LossesTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.losses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellsReuseIdentifier.dailyLosses, for: indexPath) as! LossesTableViewCell
        cell.configure(losses: self.losses[indexPath.row], dateFormatter: dateFormatter)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = LossesDetailsViewController()
        detailsVC.lossesDetail = self.losses[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

//MARK: - EnemyLossesServiceDelegate methods
extension LossesTableViewController: EnemyLossesServiceDelegate {
    
    func presentData(losses: [Losses]) {
        self.losses = losses.sorted(by: {$0.day > $1.day})
        self.tableView.reloadData()
        
        self.tableView.refreshControl?.endRefreshing()
    }
    
    func presentError(error: Error) {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default))
        self.present(alert, animated: true, completion: nil)
        
        self.tableView.refreshControl?.endRefreshing()
    }
}
