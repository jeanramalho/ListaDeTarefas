//
//  ViewController.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 06/03/25.
//

import UIKit

class ListaDeTarefasViewController: UIViewController {
    
    let contentView: ListaDeTarefasHomeView = ListaDeTarefasHomeView()
    private let tarefasDB = TarefaModel()
    var listaDeTarefas: [String] = []
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        updateTasks()
    }
    
    private func setup(){
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        setupContentView()
        setHierarchy()
        setConstraints()
    }
    
    private func updateTasks(){
        listaDeTarefas = tarefasDB.listarTarefas()
        contentView.tarefasTableView.reloadData()
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
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupContentView(){
        
        contentView.tarefasTableView.delegate = self
        contentView.tarefasTableView.dataSource = self
        contentView.tarefasTableView.register(TarefaTableViewCell.self, forCellReuseIdentifier: TarefaTableViewCell.identifier)
                
        contentView.addButton.addTarget(self, action: #selector(showCreateView), for: .touchUpInside)
        
    }
    
    
    @objc func showCreateView(){
        
        let createView = CreateViewController()
        navigationController?.pushViewController(createView, animated: true)
    }
    
    @objc func modalEdit(){
        
        let modal = EditModalViewController()
        modal.modalPresentationStyle = .pageSheet
        
        
        modal.modalPresentationStyle = .overCurrentContext
        modal.modalTransitionStyle = .crossDissolve
        modal.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        present(modal, animated: true, completion: nil)
    }
    
   
}

extension ListaDeTarefasViewController: UITableViewDelegate, UITableViewDataSource, TarefaTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDeTarefas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TarefaTableViewCell.identifier, for: indexPath) as? TarefaTableViewCell else {return UITableViewCell()}
        
        cell.tarefaLabel.text = listaDeTarefas[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    func tapEditButton(in cell: TarefaTableViewCell) {
        modalEdit()
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.tarefasDB.deletarTarefa(index: indexPath.row)
            listaDeTarefas = tarefasDB.listarTarefas()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

