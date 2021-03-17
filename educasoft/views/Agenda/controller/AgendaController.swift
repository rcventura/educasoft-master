//
//  AgendaController.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 10/03/21.
//

import Foundation

class AgendaController {
    
    private var arrayLancamentos:[AgendaElement] = []
    private var agendaLancamentoElement: AgendaElement?
    
    func loadAgendaElement(index: Int) {
        self.agendaLancamentoElement = arrayLancamentos[index]
    }

    var numberOfRows: Int {
        return self.arrayLancamentos.count
    }
    
    var agendaElement: AgendaElement? {
        return self.agendaLancamentoElement
    }
}
