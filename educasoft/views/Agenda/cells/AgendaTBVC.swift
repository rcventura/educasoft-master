//
//  AgendaTBVC.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 19/11/20.
//

import UIKit
protocol AgendaTBVCDelegate: class {
    func agendaSelecionada(id: String, disciplina: String)
}

private var controller: AgendaController = AgendaController()

class AgendaTBVC: UITableViewCell {
    
    weak var delegate: AgendaTBVCDelegate?
    //private var agenda: Agenda?
    private var arrayAgenda: AgendaElement?
    
    
    @IBOutlet weak var lbNomeProfessor: UILabel!
    @IBOutlet weak var lbNomeMateria: UILabel!
    @IBOutlet weak var cellAgenda: UIView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // SETUP DA TABLEVIEW QUE LISTA AS NOTIFICACAO DA AGENDA
    func setupAgenda(delegate: AgendaTBVCDelegate?) {
            self.delegate = delegate
            self.lbNomeProfessor.text = "Rodrigo Ventura"
            self.lbNomeMateria.text = "Matemática"
        }
    }
    
