//
//  CreateViewController.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 09/03/25.
//
import Foundation
import UIKit

class CreateViewController: UIViewController {
    
    let contentView: CreateView = CreateView()
    private let tarefasDB = TarefaModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Criar uma nova tarefa".uppercased()
        
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func setupContentView(){
        contentView.saveNewTaskButton.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
    }
    
    private func setHierarchy(){
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func saveTask(){
        if let newTask = contentView.textBoxCreate.text {
            tarefasDB.salvarTarefa(tarefa: newTask)
            contentView.textBoxCreate.text = ""
        }
        
    }
}
