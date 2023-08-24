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
            let itemView = UIView()
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            let titleLabel: UILabel = UILabel()
            titleLabel.text = item.name
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            let amountLabel: UILabel = UILabel()
            amountLabel.text = item.diff == nil || item.diff == 0
            ? String(item.amount!)
            : "(+" + String(item.diff!) + ") " + String(item.amount!)
            amountLabel.textAlignment = .right
            amountLabel.translatesAutoresizingMaskIntoConstraints = false
            
            itemView.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.leadingAnchor.constraint(equalTo: itemView.leadingAnchor),
                titleLabel.topAnchor.constraint(equalTo: itemView.topAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: itemView.bottomAnchor)
            ])
            
            itemView.addSubview(amountLabel)
            NSLayoutConstraint.activate([
                amountLabel.leadingAnchor.constraint(equalTo:titleLabel.trailingAnchor,constant: 10),
                amountLabel.trailingAnchor.constraint(equalTo: itemView.trailingAnchor),
                amountLabel.topAnchor.constraint(equalTo: itemView.topAnchor)
            ])
            
            titleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
            amountLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
            
            mainStackView.addArrangedSubview(itemView)
        }
    }
}
