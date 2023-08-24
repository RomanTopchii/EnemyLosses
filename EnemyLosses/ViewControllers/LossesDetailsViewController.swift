//
//  LossesDetailsViewController.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 24.08.2023.
//

import UIKit

class LossesDetailsViewController: UIViewController {

    var lossesDetail: Losses!
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "\(Bundle.main.localizations.first ?? "en")_\(Locale.current.language.region?.identifier ?? "US")")
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.title = dateFormatter.string(from: lossesDetail.date)
    }

}
