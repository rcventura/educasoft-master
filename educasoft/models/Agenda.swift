//
//  Agenda.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 19/11/20.
//

import Foundation

struct Agenda: Codable {
    let agendas:[AgendaElement]?
}

struct AgendaElement: Codable {
    let idagenda: String?
    let iddisciplina: String?
    let raaluno: String?
    let idprofessor: String?
    let descricao: String?
    let dtlancamento: String?
    
}
