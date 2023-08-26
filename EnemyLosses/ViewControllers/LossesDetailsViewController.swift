//
//  LossesDetailsViewController.swift
//  EnemyLosses
//
//  Created by Roman Topchii on 24.08.2023.
//

import UIKit

class LossesDetailsViewController: UIViewController {
    
    var lossesDetail: Losses?
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "\(Bundle.main.localizations.first ?? "en")_\(Locale.current.language.region?.identifier ?? "US")")
        return formatter
    }()
    
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        guard let lossesDetail = lossesDetail else {return}
        self.title = dateFormatter.string(from: lossesDetail.date)
        
        configureViews(for: lossesDetail)
    }
    
    private func configureViews(for details: Losses) {
        
        view.addSubview(mainScrollView)
        NSLayoutConstraint.activate([
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        mainScrollView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -10),
            mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor, constant: -20)
        ])
        
        for item in details.items where item.amount != nil {
            let itemView = ItemView()
            itemView.configure(item: item, showDiffAmount: true)
            mainStackView.addArrangedSubview(itemView)
        }
        
        if let greatestLossesDirection = details.greatestLossesDirection, greatestLossesDirection.isEmpty == false {
            
            let titleLabel: UILabel = UILabel()
            titleLabel.text = "Greatest losses direction: " + greatestLossesDirection
            titleLabel.numberOfLines = 0
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            mainStackView.addArrangedSubview(titleLabel)
        }
    }
}
