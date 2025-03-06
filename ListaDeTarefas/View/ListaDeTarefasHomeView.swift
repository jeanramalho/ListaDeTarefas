//
//  ListaDeTarefasHomeView.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 06/03/25.
//
import Foundation
import UIKit

class ListaDeTarefasHomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = .red
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        
    }
    
    private func setConstraints(){
        
    }
}
