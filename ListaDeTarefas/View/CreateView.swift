//
//  CreateView.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 09/03/25.
//
import Foundation
import UIKit

class CreateView: UIView {
    
    lazy var textBoxCreate: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 22)
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.layer.cornerRadius = 12
        textView.layer.borderWidth = 2.0
        textView.layer.borderColor = UIColor.lightGray.cgColor
        return textView
    }()
    
    lazy var saveNewTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        return button
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
        addSubview(textBoxCreate)
        addSubview(saveNewTaskButton)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            textBoxCreate.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            textBoxCreate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            textBoxCreate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            textBoxCreate.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            
            saveNewTaskButton.topAnchor.constraint(equalTo: textBoxCreate.bottomAnchor, constant: 16),
            saveNewTaskButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            saveNewTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
        ])
    }
}
