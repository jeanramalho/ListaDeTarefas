//
//  ViewController.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 06/03/25.
//

import UIKit

class ListaDeTarefasViewController: UIViewController {
    
    let contentView: ListaDeTarefasHomeView = ListaDeTarefasHomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup(){
        
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

}

