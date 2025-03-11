//
//  ViewController.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 06/03/25.
//

import UIKit

class ListaDeTarefasViewController: UIViewController {
    
    let contentView: ListaDeTarefasHomeView = ListaDeTarefasHomeView()
    
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
    
    private func setup(){
        
        navigationController?.setNavigationBarHidden(true, animated: true)
 
        setupContentView()
        setHierarchy()
        setConstraints()
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
        print("botao clicado")
        
        let createView = CreateViewController()
        navigationController?.pushViewController(createView, animated: true)
    }

}

extension ListaDeTarefasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TarefaTableViewCell.identifier, for: indexPath) as? TarefaTableViewCell else {return UITableViewCell()}
        
        cell.tarefaLabel.text = "tarefa teste"
        
        return cell
    }
    
    
}

