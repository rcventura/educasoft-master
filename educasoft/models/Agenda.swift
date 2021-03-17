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
    let codagenda: Int?
    let codprofessor: Int?
    let codaluno: Int?
    let coddisciplina: Int?
    let datalancamento: String?
    let mensagem: String?
}

