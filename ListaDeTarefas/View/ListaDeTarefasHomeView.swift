//
//  ListaDeTarefasHomeView.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 06/03/25.
//
import Foundation
import UIKit

class ListaDeTarefasHomeView: UIView {
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lista de Tarefas"
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .blue
        return button
    }()
    
    lazy var tarefasTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        addSubview(headerView)
        
        headerView.addSubview(titleLabel)
        headerView.addSubview(addButton)
        
        addSubview(tarefasTableView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            
            addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -12),
            
            tarefasTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            tarefasTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tarefasTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tarefasTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
