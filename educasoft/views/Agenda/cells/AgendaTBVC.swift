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

class AgendaTBVC: UITableViewCell {
    
    weak var delegate: AgendaTBVCDelegate?
    //private var agenda: Agenda?
    
    @IBOutlet weak var lbNomeProfessor: UILabel!
    @IBOutlet weak var lbNomeMateria: UILabel!
    @IBOutlet weak var cellAgenda: UIView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: AgendaElement?, delegate: AgendaTBVCDelegate?) {
        
        if let _value = value {
            //self.agenda = value
            self.delegate = delegate
            self.lbNomeProfessor.text = _value.idprofessor
            self.lbNomeMateria.text = _value.iddisciplina

        }
        }
        
    }
    
