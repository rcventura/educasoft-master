//
//  AgendaDetalheTBVC.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 02/12/20.
//

import UIKit

class AgendaDetalheTBVC: UITableViewCell {

    @IBOutlet weak var lbDetailNomeProfessor: UILabel!
    @IBOutlet weak var lbDatailDisciplina: UILabel!
    
    private var agenda: Agenda?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupdetalhe(value: AgendaElement?) {
        if let _value = value {
           // self.lbDetailNomeProfessor = _value.codprofessor
           // self.lbDatailDisciplina.text = _value.coddisciplina
            
        }
        
    }
    
}
