//
//  TarefaTableViewCell.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 11/03/25.
//
import Foundation
import UIKit

protocol TarefaTableViewCellDelegate: AnyObject {
    func tapEditButton(in cell: TarefaTableViewCell)
}

class TarefaTableViewCell: UITableViewCell {
    
    static let identifier: String = "TarefaTableViewCell"
    
    weak var delegate: TarefaTableViewCellDelegate?
    
    lazy var tarefaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("editar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        contentView.addSubview(tarefaLabel)
        contentView.addSubview(editButton)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            editButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            tarefaLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            tarefaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tarefaLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tarefaLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            
        ])
    }
    
    @objc private func editButtonTapped(){
        delegate?.tapEditButton(in: self)

    }
}
