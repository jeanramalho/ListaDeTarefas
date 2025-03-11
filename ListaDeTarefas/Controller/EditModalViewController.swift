//
//  EditModal.swift
//  ListaDeTarefas
//
//  Created by Jean Ramalho on 11/03/25.
//
import Foundation
import UIKit

class EditModalViewController: UIViewController {
    
    let contentView: EditModalView = EditModalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setupContentView()
        addEventObserver()
        setHierarchy()
        setConstraints()
    }
    
    private func addEventObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupContentView(){
        contentView.layer.cornerRadius = 60
        
        contentView.closeModalButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
    }
    
    private func setHierarchy(){
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
    
    @objc private func closeModal(){
        dismiss(animated: true, completion: nil)
    }
    
    // 🔹 Ajusta a posição do containerView quando o teclado aparece
       @objc private func keyboardWillShow(_ notification: Notification) {
           // Obtém a altura do teclado
           guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
           let keyboardHeight = keyboardFrame.height
           
           // Anima a transformação do containerView para subir
           UIView.animate(withDuration: 0.3) {
               // Desloca o containerView para cima pela metade da altura do teclado
               self.contentView.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight / 2)
           }
       }
    
    // 🔹 Restaura a posição original do containerView quando o teclado some
    @objc private func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.contentView.transform = .identity
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
