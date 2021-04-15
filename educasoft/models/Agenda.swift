//
//  Agenda.swift
//  educasoft
//
//  Created by Rodrigo Ventura on 19/11/20.
//

import Foundation

typealias Agenda = [AgendaElement]

struct AgendaElement: Codable {
    let codagenda: Int?
    let codprofessor: Professor
    let codaluno: Int?
    let coddisciplina: Disciplinas
    let datalancamento: String?
    let mensagem: String?
}

