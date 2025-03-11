//
//  EditModalView.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 11/03/25.
//
import Foundation
import UIKit

class EditModalView: UIView {
    
    lazy var closeModalButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    lazy var tarefaTextView: UITextView = {
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
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 18
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
        addSubview(closeModalButton)
        addSubview(tarefaTextView)
        addSubview(saveButton)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            closeModalButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            closeModalButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            tarefaTextView.topAnchor.constraint(equalTo: closeModalButton.bottomAnchor, constant: 18),
            tarefaTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            tarefaTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            tarefaTextView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            
            saveButton.topAnchor.constraint(equalTo: tarefaTextView.bottomAnchor, constant: 16),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
        ])
    }
}
