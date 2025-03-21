//
//  TarefaModel.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 11/03/25.
//
import Foundation
import UIKit

class TarefaModel {
    
    let chave: String = "listaDeTarefas"
    var tarefas: [String] = []
    
    func salvarTarefa(tarefa: String){
        
        //recupera tarefas atuais
        tarefas = listarTarefas()
        
        //salvar tarefa no array
        tarefas.append(tarefa)
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
    
    func listarTarefas() -> [String] {
        if let dados = UserDefaults.standard.object(forKey: chave) {
            return dados as! [String]
        } else {
            return []
        }
    }
    
    func deletarTarefa(index: Int){
        //recupera tarefas atuais
        tarefas = listarTarefas()
        
        //deleta tarefa escolhida pelo index
        tarefas.remove(at: index)
        
        //salva lista de tarefas atualizadas
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
    
    func editarTarefa(tarefa: String, index: Int){
        //recupera tarefas atuais
        tarefas = listarTarefas()
        
        //edita tarefa escolhida
        tarefas[index] = tarefa
        
        //salva lista de tarefas atualizadas
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
}

